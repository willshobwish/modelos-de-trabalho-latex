"""Package one compiled LaTeX model for a GitHub release."""

from pathlib import Path
import shutil
import subprocess
import sys
from zipfile import ZIP_DEFLATED, ZipFile


GENERATED_FILES = {"main.glsdefs", "main.loa"}
LFS_POINTER = b"version https://git-lfs.github.com/spec/v1"


def package(model_name: str, output_dir: Path) -> None:
    repo = Path(__file__).resolve().parent.parent
    model = repo / model_name
    if model_name != model.name or not (model / "main.tex").is_file():
        raise ValueError(f"Modelo inválido: {model_name}")

    pdf = model / "main.pdf"
    if not pdf.is_file() or not pdf.read_bytes().startswith(b"%PDF-"):
        raise ValueError(f"PDF compilado ausente ou inválido: {pdf}")

    paths = subprocess.check_output(
        ["git", "ls-files", "-z", "--", model_name], cwd=repo
    ).decode("utf-8").split("\0")
    output_dir.mkdir(parents=True, exist_ok=True)
    archive = output_dir / f"{model_name}.zip"
    with ZipFile(archive, "w", ZIP_DEFLATED) as zip_file:
        for path in paths:
            if not path:
                continue
            relative = Path(path).relative_to(model_name)
            if relative.name in GENERATED_FILES:
                continue
            source = repo / path
            if not source.is_file():
                raise FileNotFoundError(source)
            if source.read_bytes().startswith(LFS_POINTER):
                raise ValueError(f"Git LFS não baixou: {source}")
            zip_file.write(source, relative.as_posix())
        if "main.pdf" not in zip_file.namelist():
            zip_file.write(pdf, "main.pdf")

    with ZipFile(archive) as zip_file:
        if zip_file.testzip() is not None or not {"main.tex", "main.pdf"} <= set(
            zip_file.namelist()
        ):
            raise ValueError(f"ZIP inválido: {archive}")
    shutil.copyfile(pdf, output_dir / f"{model_name}.pdf")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        raise SystemExit("Uso: package_release.py MODELO DIRETORIO_DE_SAIDA")
    package(sys.argv[1], Path(sys.argv[2]))
