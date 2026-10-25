# Modelos de trabalhos acadêmicos em LaTeX

Este repositório reúne modelos de documentos e apresentações. Cada pasta abaixo é um projeto independente, com `main.tex` como arquivo principal:

| Projeto | Pasta |
| --- | --- |
| Apresentação para mostra científica | [`apresentacao_mostra_cientifica`](apresentacao_mostra_cientifica/) |
| Apresentação de revisão bibliográfica | [`apresentacao_revisao_bibliografica`](apresentacao_revisao_bibliografica/) |
| Documento de casos de uso | [`documento_de_casos_de_uso_es1`](documento_de_casos_de_uso_es1/) |
| Documento de requisitos de software | [`documento_requisitos_de_software_es1_ieee`](documento_requisitos_de_software_es1_ieee/) |
| Anteprojeto de TCC | [`modelo_anteprojeto_de_tcc`](modelo_anteprojeto_de_tcc/) |
| Artigo de TCC | [`modelo_artigo_tcc`](modelo_artigo_tcc/) |
| Relatório de iniciação científica | [`modelo_relatorio_de_ic`](modelo_relatorio_de_ic/) |
| Revisão bibliográfica de TCC | [`modelo_revisao_bibliografica_tcc`](modelo_revisao_bibliografica_tcc/) |
| Segurança da informação | [`modelo_seguranca_da_informacao`](modelo_seguranca_da_informacao/) |

No `modelo_anteprojeto_de_tcc`, altere os dados como título, autor, orientador e cidade no preâmbulo de `main.tex`. A formatação e os comandos desse modelo estão em `anteprojeto_tcc.cls`, na raiz da pasta. No `modelo_seguranca_da_informacao`, altere os dados em `config/commands.sty`. Nos demais projetos, localize esses dados no respectivo `main.tex` e nos arquivos carregados por ele.

## Compilação local

Instale uma distribuição TeX, como TeX Live ou MiKTeX, e o `latexmk`. Execute os comandos **dentro da pasta do projeto**; todos usam `main.tex` como arquivo principal. Por exemplo:

```sh
cd modelo_anteprojeto_de_tcc
latexmk -pdf main.tex
```

O `latexmk` executa novamente o compilador e as ferramentas de bibliografia, como o Biber, quando necessário. Use a opção correspondente ao compilador desejado:

| Compilador | Comando para gerar `main.pdf` |
| --- | --- |
| pdfLaTeX (padrão destes modelos) | `latexmk -pdf main.tex` |
| XeLaTeX | `latexmk -pdfxe main.tex` |
| LuaLaTeX | `latexmk -pdflua main.tex` |

Os modelos foram preparados para pdfLaTeX. XeLaTeX e LuaLaTeX são alternativas para projetos que usam recursos específicos desses compiladores; trocar de compilador pode exigir ajustes em pacotes e fontes.

Comandos úteis durante a edição:

| Objetivo | Comando |
| --- | --- |
| Compilar e abrir o PDF uma vez | `latexmk -pdf -pv main.tex` |
| Recompilar ao salvar e acompanhar o PDF | `latexmk -pdf -pvc main.tex` |
| Recompilar ao salvar sem abrir um visualizador | `latexmk -pdf -pvc -view=none main.tex` |
| Remover arquivos auxiliares, mantendo o PDF | `latexmk -c main.tex` |
| Remover auxiliares **e o PDF** | `latexmk -C main.tex` |
| Limpar e compilar novamente do zero | `latexmk -gg -pdf main.tex` |

Encerre o modo contínuo (`-pvc`) com **Ctrl+C**. O comando `-C` também apaga `main.pdf`; use `-c` quando quiser preservar o PDF gerado. Como alguns PDFs são versionados neste repositório, `-C` pode fazê-los aparecer como excluídos no Git até a próxima compilação.

**Exemplo no Windows com SumatraPDF:** defina o SumatraPDF como aplicativo padrão para arquivos `.pdf` e execute `latexmk -pdf -pvc main.tex` na pasta do projeto. O `latexmk` abre o visualizador padrão e recompila ao salvar; o SumatraPDF consegue atualizar o PDF aberto sem bloquear a próxima compilação. Se preferir configurar o visualizador explicitamente, adicione ao `latexmkrc` do projeto (ajustando o caminho de instalação):

```perl
if ($^O eq 'MSWin32') {
    $pdf_previewer = 'start "C:/Program Files/SumatraPDF/SumatraPDF.exe" %O %S';
}
```

Também é possível chamar `pdflatex main.tex`, `xelatex main.tex` ou `lualatex main.tex` diretamente, mas isso executa apenas uma passagem. Para atualizar sumário, citações e referências, prefira o `latexmk`, que coordena as passagens necessárias. Em caso de erro, use `latexmk -pdf -file-line-error -halt-on-error main.tex` para interromper na primeira falha e mostrar o arquivo e a linha. Alguns projetos podem precisar de pacotes adicionais da distribuição TeX. Consulte o [manual do latexmk](https://tug.ctan.org/support/latexmk/latexmk.pdf) para as demais opções.

## Arquivos ZIP e Overleaf

Baixe o ZIP do projeto desejado na [release mais recente](https://github.com/willshobwish/modelos-de-trabalho-latex/releases/latest). Cada release inclui um ZIP com fontes, imagens e PDF compilado, além de um PDF separado por projeto.

Cada ZIP contém os arquivos do projeto na raiz do arquivo compactado. Para descompactar localmente, crie uma pasta para ele:

```sh
mkdir modelo_anteprojeto_de_tcc
unzip modelo_anteprojeto_de_tcc.zip -d modelo_anteprojeto_de_tcc
```

No Overleaf, use **New Project → Upload Project** e selecione o ZIP do projeto. Se necessário, escolha `main.tex` como arquivo principal.

## Integração contínua e releases

O [workflow LaTeX](.github/workflows/latex.yml) é acionado em commits e pull requests que alterem algum modelo, o próprio workflow, os scripts de empacotamento ou a configuração do Git LFS. Ele compila e valida somente os modelos alterados; mudanças nas ferramentas comuns testam todos. Alterações apenas na documentação não disparam a compilação. Ao publicar uma release, ele compila novamente os nove modelos da tag e anexa os ZIPs e PDFs somente se todos passarem. Se houver falha, consulte o log do projeto na execução do workflow.

## Referências de formatação

Parte dos modelos foi elaborada com base na [apostila de normalização da Biblioteca da FCT/Unesp de 2021](https://www.fct.unesp.br/Home/Biblioteca/abnt/apostila_abnt_word_bpp_2021.pdf). Antes de entregar um trabalho, confira as exigências atuais do curso, da instituição e do evento. Consulte também a [página de normalização da Biblioteca da FCT](https://www.fct.unesp.br/#!/biblioteca2340/normalizacao/abnt/). Os modelos não foram verificados quanto às normas da Sociedade Brasileira de Computação.

## Licenças e direitos autorais

Leia [`LICENSE.md`](LICENSE.md) para o texto da LaTeX Project Public License e [`LICENSE-DOCUMENTS.md`](LICENSE-DOCUMENTS.md) para o aviso sobre o conteúdo acadêmico. Confira os avisos específicos de cada arquivo ou trabalho antes de reutilizá-lo.
