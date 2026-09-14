% ======================================================================
% Classe para Artigos Científicos no Padrão ABNT
% ======================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{artigo-abnt}[2025/11/12 v1.0 Classe para artigos ABNT]

% ======================================================================
% Opções da Classe
% ======================================================================
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[12pt]{article}

% ======================================================================
% Formatação de Texto
% ======================================================================
\RequirePackage{setspace}

\onehalfspacing
\RequirePackage{ragged2e}
\RequirePackage{indentfirst}                  % Indenta primeiro parágrafo

% ======================================================================
% Pacotes Essenciais
% ======================================================================
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english,brazil]{babel}  % Inglês disponível, padrão português
\RequirePackage{mathptmx}           % Times New Roman
\RequirePackage{hyphenat}           % Hifenização aprimorada

% ======================================================================
% Autoria e Afiliação
% ======================================================================
\RequirePackage{authblk}
\renewcommand\Authand{, }
\renewcommand\Authands{, }

% ======================================================================
% Geometria da Página
% ======================================================================
\RequirePackage[
  a4paper,
  left=30mm,
  right=20mm,
  top=30mm,
  bottom=20mm
]{geometry}
% ======================================================================
% Formatação de Seções
% ======================================================================
\RequirePackage{sectsty}
\sectionfont{\normalsize}
\subsectionfont{\normalsize}
\subsubsectionfont{\normalsize}

\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\thesection\arabic{subsection}.}
\renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}.}

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

% ======================================================================
% Cabeçalho e Rodapé
% ======================================================================
\RequirePackage{fancyhdr}
\RequirePackage{footmisc}

% Configuração de cabeçalho e rodapé
\pagestyle{fancy}
\fancyhf{}                          % Limpa cabeçalho e rodapé
\fancyfoot[C]{\thepage}             % Número da página centralizado no rodapé
\renewcommand{\headrulewidth}{0pt}  % Remove linha do cabeçalho
\renewcommand{\footrulewidth}{0pt}  % Remove linha do rodapé

% Ajusta a posição do rodapé para ficar acima da margem
\setlength{\footskip}{15pt}         % Distância do rodapé ao fim do texto

% Aplica o mesmo estilo para páginas especiais (como a primeira)
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[C]{\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

% Linha do rodapé reduzida (para notas de rodapé)
\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width 5cm
  \kern 2pt
}

% ======================================================================
% Matemática
% ======================================================================
\RequirePackage{amsmath, amssymb, bm}
\DeclareMathAlphabet{\mathcal}{OMS}{cmsy}{m}{n}

% ======================================================================
% Tabelas e Figuras
% ======================================================================
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{float}

% Legendas otimizadas
\RequirePackage[
  skip=10pt,
  font=small,
  labelfont=bf
]{caption}
\RequirePackage{subcaption}

% Remove espaçamento 1.5 das tabelas automaticamente
\AtBeginEnvironment{tabular}{\singlespacing}
\AtBeginEnvironment{tabular*}{\singlespacing}

% ======================================================================
% Algoritmos
% ======================================================================
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\floatname{algorithm}{Algoritmo}
\renewcommand{\listalgorithmname}{Lista de Algoritmos}
\renewcommand{\algorithmicrequire}{\textbf{Entrada:}}
\renewcommand{\algorithmicensure}{\textbf{Saída:}}
\renewcommand{\algorithmicfor}{\textbf{para}}
\renewcommand{\algorithmicdo}{\textbf{faça}}
\renewcommand{\algorithmicendfor}{\textbf{fim para}}
\renewcommand{\algorithmicreturn}{\textbf{retorne}}

% ======================================================================
% Listagens de Código
% ======================================================================
\RequirePackage{listings}
\RequirePackage{xcolor}

% Definição de cores para código
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{1,1,1}

% Estilo de código otimizado
\lstdefinestyle{mystyle}{
  backgroundcolor=\color{backcolour},   
  commentstyle=\color{codegreen},
  keywordstyle=\color{magenta},
  numberstyle=\tiny\color{codegray},
  stringstyle=\color{codepurple},
  basicstyle=\ttfamily\footnotesize\setstretch{1.0},
  breaklines=true,
  captionpos=b,
  keepspaces=true,
  numbers=left,
  numbersep=5pt,
  showstringspaces=false,
  tabsize=2
}
\lstset{style=mystyle}
\renewcommand{\lstlistingname}{Código}
\renewcommand{\lstlistlistingname}{Lista de Códigos}

% ======================================================================
% Bibliografia (BibLaTeX com ABNT)
% ======================================================================
\RequirePackage{csquotes}
\RequirePackage[style=abnt]{biblatex}
\renewcommand*{\bibfont}{\normalfont\justifying}

% Faz as referências aparecerem como seção numerada com espaçamento correto
\defbibheading{bibliography}[\refname]{%
  \section{#1}%
}

% ======================================================================
% Hyperlinks
% ======================================================================
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  allcolors=black,
  urlcolor=black,
  citecolor=black
}
\urlstyle{same}

% ======================================================================
% Utilitários
% ======================================================================
\RequirePackage{quoting}            % Blocos de citação
\RequirePackage{import}             % Importação modular

% Indicação padronizada da fonte de figuras.
\newcommand{\fonteimagem}[1]{%
  \par\smallskip{\footnotesize #1}\par
}

\endinput
