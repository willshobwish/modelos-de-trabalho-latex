% Classe da apresentacao de revisao bibliografica.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{apresentacao_revisao_bibliografica}[2026/10/25 Apresentacao de revisao bibliografica]

% Repassa as opcoes de \documentclass (por exemplo, aspectratio=169) ao Beamer.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
% O Beamer carrega xcolor; a opcao table deve ser passada antes da classe base.
\PassOptionsToPackage{table}{xcolor}
\LoadClass{beamer}

% -----------------------------------------------------------------------------
% Codificacao e idioma
% -----------------------------------------------------------------------------
% Le caracteres acentuados diretamente dos arquivos .tex em UTF-8.
\RequirePackage[utf8]{inputenc}
% Define nomes automaticos e regras de hifenizacao em portugues brasileiro.
\RequirePackage[brazil]{babel}

% -----------------------------------------------------------------------------
% Texto e matematica
% -----------------------------------------------------------------------------
% Disponibiliza \justifying e outros comandos de alinhamento de paragrafos.
\RequirePackage{ragged2e}
% Usa fontes com aparencia proxima a Times no texto e na matematica.
\RequirePackage{mathptmx}
% Fornece ambientes e comandos para equacoes.
\RequirePackage{amsmath}

% -----------------------------------------------------------------------------
% Figuras, legendas e posicionamento
% -----------------------------------------------------------------------------
% Insere imagens externas, inclusive as figuras PDF usadas nos slides.
\RequirePackage{graphicx}
% Permite o especificador de posicionamento [H].
\RequirePackage{float}

% -----------------------------------------------------------------------------
% Citacoes em bloco
% -----------------------------------------------------------------------------
% Fornece o ambiente quoting para citacoes longas.
\RequirePackage{quoting}

% -----------------------------------------------------------------------------
% Legendas e figuras compostas
% -----------------------------------------------------------------------------
% Personaliza legendas e ativa as subfiguras usadas na apresentacao.
\RequirePackage{caption}
\RequirePackage{subcaption}
% Permite texto ao redor de figuras, quando necessario.
\RequirePackage{wrapfig}

% -----------------------------------------------------------------------------
% Tabelas, colunas e algoritmos
% -----------------------------------------------------------------------------
% Mescla celulas verticalmente e cria colunas de texto lado a lado.
\RequirePackage{multirow}
\RequirePackage{multicol}
% Define ambientes de algoritmo e pseudocodigo.
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}

% -----------------------------------------------------------------------------
% Citacoes, hifenizacao e arquivos auxiliares
% -----------------------------------------------------------------------------
% Ajusta aspas de acordo com o idioma e integra-se ao biblatex.
\RequirePackage{csquotes}
% Oferece controle explicito sobre a hifenizacao de palavras.
\RequirePackage{hyphenat}
% Facilita a inclusao de arquivos a partir de outros diretorios.
\RequirePackage{import}

% -----------------------------------------------------------------------------
% Recursos de edicao e layout
% -----------------------------------------------------------------------------
% Gera texto ficticio para experimentar a diagramacao.
\RequirePackage{lipsum}
% Adiciona chaves de alinhamento e recorte a \includegraphics.
\RequirePackage[export]{adjustbox}
% Controla o espacamento entre linhas.
\RequirePackage{setspace}
% Cria tabelas com colunas de largura ajustavel.
\RequirePackage{tabularx}
% Formata trechos de codigo-fonte.
\RequirePackage{listings}

% -----------------------------------------------------------------------------
% Bibliografia
% -----------------------------------------------------------------------------
% Aplica o estilo ABNT as citacoes e a lista de referencias.
\RequirePackage[style=abnt]{biblatex}
% Arquivo de referencias relativo ao documento principal.
\addbibresource{referencias.bib}

% Tema, rodape e elementos dos quadros.
\usetheme{Warsaw}
\apptocmd{\frame}{}{\justifying}{}
\setbeamertemplate{footline}{%
  \leavevmode%
  \hbox{\begin{beamercolorbox}[wd=.5\paperwidth,ht=4.5ex,dp=2.125ex,leftskip=.3cm plus1fill,rightskip=.3cm]{author in head/foot}%
    \usebeamerfont{author in head/foot}\insertshortauthor
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.5\paperwidth,ht=4.5ex,dp=2.125ex,leftskip=.3cm,rightskip=.3cm plus1fil]{title in head/foot}%
    \usebeamerfont{title in head/foot}%
    \parbox{.45\paperwidth}{\inserttitle}%
  \end{beamercolorbox}}%
  \vskip0pt%
}
\setbeamertemplate{caption}[numbered]
\setbeamerfont{itemize/enumerate body}{size=\normalsize}
\setbeamerfont{itemize/enumerate subbody}{size=\normalsize}
\setbeamertemplate{headline}{}
\setbeamertemplate{frametitle continuation}{}

% Aparencia dos links no PDF e ajustes pontuais de tabelas e notas.
\hypersetup{colorlinks=true,linkcolor=black,filecolor=black,urlcolor=black,citecolor=black,pdftitle={}}
\urlstyle{same}
\renewcommand\tabularxcolumn[1]{m{#1}}
\renewcommand{\footnoterule}{%
  \vspace{\fill}\kern -3pt\hrule width 5cm\kern 2pt%
}

% Paleta e estilo padrao dos blocos de codigo produzidos por listings.
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{1,1,1}
\lstdefinestyle{mystyle}{%
  backgroundcolor=\color{backcolour},
  commentstyle=\color{codegreen},
  keywordstyle=\color{magenta},
  numberstyle=\tiny\color{codegray},
  stringstyle=\color{codepurple},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  keepspaces=true,
  numbers=left,
  numbersep=5pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=2
}
\lstset{style=mystyle}
% Mantem o alfabeto caligrafico usado nas formulas da apresentacao.
\DeclareMathAlphabet{\mathcal}{OMS}{cmsy}{m}{n}
