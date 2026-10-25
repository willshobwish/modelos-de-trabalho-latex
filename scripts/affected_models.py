"""Choose LaTeX models affected by a push, pull request, or release."""

import json
import os
from pathlib import Path
import subprocess
import sys


MODELS = (
    "apresentacao_mostra_cientifica",
    "apresentacao_revisao_bibliografica",
    "documento_de_casos_de_uso_es1",
    "documento_requisitos_de_software_es1_ieee",
    "modelo_anteprojeto_de_tcc",
    "modelo_artigo_tcc",
    "modelo_relatorio_de_ic",
    "modelo_revisao_bibliografica_tcc",
    "modelo_seguranca_da_informacao",
)
GLOBAL_PATHS = {".github/workflows/latex.yml", ".gitattributes"}


def affected_models(paths: list[str]) -> list[str]:
    if any(path in GLOBAL_PATHS or path.startswith("scripts/") for path in paths):
        return list(MODELS)
    return [model for model in MODELS if any(path.startswith(model + "/") for path in paths)]


def changed_paths(base: str, head: str) -> list[str] | None:
    if not base or set(base) == {"0"}:
        return None  # New branch: there is no previous commit to compare.
    result = subprocess.run(
        ["git", "diff", "--no-renames", "--name-only", "-z", base, head, "--"],
        cwd=Path(__file__).resolve().parent.parent,
        capture_output=True,
        check=False,
    )
    if result.returncode:
        print("Não foi possível comparar commits; todos os modelos serão testados.", file=sys.stderr)
        return None
    return [path for path in result.stdout.decode("utf-8").split("\0") if path]


if __name__ == "__main__":
    event = os.environ["EVENT_NAME"]
    paths = None if event == "release" else changed_paths(
        os.environ.get("BASE_SHA", ""), os.environ["HEAD_SHA"]
    )
    models = list(MODELS) if paths is None else affected_models(paths)
    print("models=" + json.dumps(models, separators=(",", ":")))
