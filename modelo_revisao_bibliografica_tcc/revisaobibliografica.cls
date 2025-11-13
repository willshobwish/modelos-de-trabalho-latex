% ========================================
% IDENTIFICAÇÃO DA CLASSE
% ========================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{revisaobibliografica}[2025/11/13 Classe para Revisão Bibliográfica TCC]

% ========================================
% OPÇÕES DA CLASSE
% ========================================
% Passa todas as opções não reconhecidas para a classe article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Carrega a classe base 'article' com tamanho de fonte 12pt
\LoadClass[12pt]{article}

% ========================================
% CONFIGURAÇÕES DE CODIFICAÇÃO E IDIOMA
% ========================================

% Define a codificação de entrada do arquivo como UTF-8
% Permite o uso de caracteres especiais diretamente no código
\RequirePackage[utf8]{inputenc}

% Codificação de saída da fonte para suportar caracteres acentuados
% T1 é recomendado para idiomas com acentos
\RequirePackage[T1]{fontenc}

% Configuração de idiomas do documento
% 'brazil' é o idioma principal, 'english' é secundário
% Afeta hifenização, nomes de seções, formato de datas, etc.
\RequirePackage[english,brazil]{babel}

% ========================================
% CONFIGURAÇÕES DE FONTE E FORMATAÇÃO
% ========================================

% Define a fonte Times New Roman como padrão do documento
% Fonte serifada tradicionalmente usada em documentos acadêmicos
\RequirePackage{mathptmx}

% ======================================================================
% Formatação de Texto
% ======================================================================
\RequirePackage{setspace}
\setstretch{1.5}                % Aplica espaçamento do texto

% Força a identação do primeiro parágrafo após títulos de seções
% Por padrão, LaTeX não indenta o primeiro parágrafo
\RequirePackage{indentfirst}

% Melhores algoritmos de justificação e alinhamento de texto
% Oferece comandos como \RaggedRight, \Centering, etc.
\RequirePackage{ragged2e}

% Controle do tamanho das fontes dos títulos das seções
\RequirePackage{sectsty}
\sectionfont{\normalsize}        % Seções com tamanho normal
\subsectionfont{\normalsize}     % Subseções com tamanho normal
\subsubsectionfont{\normalsize}  % Sub-subseções com tamanho normal

% ========================================
% CONFIGURAÇÕES DE PÁGINA
% ========================================

% Define as margens da página conforme padrões acadêmicos brasileiros
% Papel A4 com margens: esquerda 30mm, direita 20mm, superior 30mm, inferior 20mm
\RequirePackage[a4paper, left=30mm, right=20mm, top=30mm, bottom=20mm]{geometry}

% ========================================
% CONFIGURAÇÕES DE CABEÇALHO E RODAPÉ
% ========================================

% Pacote para personalizar cabeçalhos e rodapés
\RequirePackage{fancyhdr}

% Define o estilo de página como 'fancy'
\pagestyle{fancy}

% Limpa todos os campos de cabeçalho e rodapé
\fancyhf{}

% Define que apenas o número da página aparece no canto superior direito
\fancyhead[R]{\thepage}

% Remove as linhas horizontais do cabeçalho e rodapé
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Configura o estilo 'plain' (usado em páginas especiais como a primeira)
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[R]{\thepage}  % Número da página também no estilo plain
}

% ========================================
% CONFIGURAÇÕES PARA TABELAS
% ========================================

% Permite células que ocupam múltiplas linhas
\RequirePackage{multirow}

% Tabelas com largura ajustável automaticamente
\RequirePackage{tabularx}

% Suporte a cores em tabelas
\RequirePackage[table]{xcolor}

% Alinhamento vertical centralizado para colunas X do tabularx
\renewcommand\tabularxcolumn[1]{m{#1}}

% ========================================
% CONFIGURAÇÕES PARA FIGURAS
% ========================================

% Inclusão de imagens nos formatos mais comuns
\RequirePackage{graphicx}

% Legendas personalizáveis para figuras e tabelas
\RequirePackage{caption}

% Subfiguras (figuras lado a lado com legendas individuais)
\RequirePackage{subcaption}

% Controle preciso do posicionamento de elementos flutuantes
% [H] força o posicionamento exato onde o código foi inserido
\RequirePackage{float}

% ========================================
% CONFIGURAÇÕES DE HIPERLINKS
% ========================================

% Criação de hiperlinks e bookmarks no PDF
\RequirePackage{hyperref}

% Configurações dos hiperlinks
\hypersetup{
    colorlinks=true,    % Links coloridos ao invés de caixas
    linkcolor=black,    % Cor dos links internos (sumário, referências cruzadas)
    filecolor=black,    % Cor dos links para arquivos
    urlcolor=black,     % Cor dos URLs
    citecolor=black,    % Cor das citações
    pdftitle={},        % Define o título do documento PDF (vazio neste caso)
}

% URLs com a mesma fonte do texto normal
\urlstyle{same}

% ========================================
% CONFIGURAÇÕES BIBLIOGRÁFICAS (ABNT)
% ========================================

% Suporte aprimorado para aspas (necessário para biblatex)
\RequirePackage{csquotes}

% Sistema de bibliografia moderno com estilo ABNT
\RequirePackage[style=abnt]{biblatex}

% ========================================
% CONFIGURAÇÕES PARA CÓDIGO-FONTE
% ========================================

% Pacote principal para listagens de código
\RequirePackage{listings}

% Definição de cores personalizadas para syntax highlighting
\definecolor{codegreen}{rgb}{0,0.6,0}      % Verde para comentários
\definecolor{codegray}{rgb}{0.5,0.5,0.5}   % Cinza para números de linha
\definecolor{codepurple}{rgb}{0.58,0,0.82} % Roxo para strings
\definecolor{backcolour}{rgb}{1,1,1}       % Fundo branco

% Estilo personalizado para listagens de código
\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},   % Cor de fundo
    commentstyle=\color{codegreen},       % Estilo dos comentários
    keywordstyle=\color{magenta},         % Estilo das palavras-chave
    numberstyle=\tiny\color{codegray},    % Estilo dos números de linha
    stringstyle=\color{codepurple},       % Estilo das strings
    basicstyle=\ttfamily\footnotesize\setstretch{1.0},
    breaklines=true,                      % Quebra linhas longas automaticamente
    captionpos=b,                         % Posição da legenda (bottom)
    keepspaces=true,                      % Preserva espaços
    numbers=left,                         % Números de linha à esquerda
    numbersep=5pt,                        % Separação entre números e código
    showspaces=false,                     % Não mostra espaços
    showstringspaces=false,               % Não mostra espaços em strings
    showtabs=false,                       % Não mostra tabs
    tabsize=2                             % Tamanho do tab = 2 espaços
}

% Aplica o estilo personalizado como padrão
\lstset{style=mystyle}

% ========================================
% CONFIGURAÇÕES DE NOMENCLATURA
% ========================================

% Sistema para lista de siglas e símbolos
\RequirePackage{nomencl}

% Gera os arquivos necessários para a nomenclatura
\makenomenclature

% ========================================
% PACOTES UTILITÁRIOS ADICIONAIS
% ========================================

% Destacar texto com cores de fundo (comando \hl{})
\RequirePackage{soul}

% Citações em bloco com melhor formatação
\RequirePackage{quoting}

% Importar arquivos TeX de subdiretórios mantendo caminhos relativos
\RequirePackage{import}

% Controle avançado de hifenização
\RequirePackage{hyphenat}

% Legendas otimizadas
\RequirePackage[
  skip=10pt,
  font=small,
  labelfont=bf
]{caption}
\RequirePackage{subcaption}

% ========================================
% COMANDOS PERSONALIZADOS
% ========================================

% Ambiente para exibir a natureza do trabalho (ex: monografia, TCC, etc.)
% Insere um recuo à direita (59mm) e um bloco de texto justificado com largura de 95mm.
\newenvironment{natureza}
  {\hspace{59mm}\begin{minipage}[c]{95mm}\begin{justify}}
  {\end{justify}\end{minipage}}

% Ambiente para citações longas.
% Adiciona espaçamento vertical antes e depois, centraliza o conteúdo em uma caixa de 120mm,
% define espaçamento entre linhas como 1.0 e reduz o tamanho da fonte para \small.
\newenvironment{longcite}
  {\vspace{5mm}\hfill\begin{minipage}[c]{120mm}\setstretch{1.0}\small}
  {\end{minipage}\vspace{5mm}}

% Comando para o título do trabalho. Pode ser sobrescrito depois.
\newcommand{\titulo}{\textbf{Titulo}}

% Nome do autor do trabalho.
\newcommand{\nome}{Nome Sobrenome}

% Nome do orientador. Pode ser alterado conforme necessário.
\newcommand{\orientador}{Prof. Dr. Nome Sobrenome}

% Cidade e estado onde o trabalho foi realizado.
\newcommand{\cidade}{Cidade}
\newcommand{\cidadeestado}{\cidade\;-- Estado}

% Tipo de trabalho (ex: Artigo, Revisão bibliográfica, Projeto experimental, etc.)
\newcommand{\tipotrabalho}{Revisão bibliográfica}

% Nome do professor convidado da banca ou avaliador externo.
\newcommand{\professorconvidado}{Prof. Dr. Nome Sobrenome}

% Comando para exibir a fonte de uma imagem com espaçamento vertical antes e centralização.
\newcommand{\fonteimagem}[1]{\vspace{\baselineskip}\centering #1}

% ========================================
% PERSONALIZAÇÕES DE NOMES E TÍTULOS
% ========================================

% Executa as redefinições após o início do documento
\AtBeginDocument{
    % Renomeia elementos para português brasileiro
    \renewcommand{\lstlistingname}{Código}
    \renewcommand{\lstlistlistingname}{\centering \normalsize \uppercase{Lista de Códigos}}
    \renewcommand{\contentsname}{\centering \normalsize \uppercase{Sumário}}
    \renewcommand{\nomname}{\centering \normalsize \uppercase{Siglas}}
    \renewcommand{\listfigurename}{\centering \normalsize \uppercase{Lista de Figuras}}
    \renewcommand{\listtablename}{\centering \normalsize \uppercase{Lista de Tabela}}
}

% Formatação da bibliografia: fonte normal e texto justificado
\defbibheading{bibliography}[\refname]{%
  \section{#1}%
}
\renewcommand*{\bibfont}{\normalfont\justifying}

% ========================================
% PERSONALIZAÇÕES DE NOTAS DE RODAPÉ
% ========================================

% Customiza a linha separadora das notas de rodapé
\renewcommand{\footnoterule}{
    \kern -3pt          % Espaçamento negativo acima da linha
    \hrule width 5cm    % Linha horizontal de 5cm
    \kern 2pt           % Espaçamento abaixo da linha
}

% ========================================
% FIM DA CLASSE
% ========================================
\endinput
