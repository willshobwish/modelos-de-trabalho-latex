\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{requisitos-ieee}[2026/10/25 Classe para documento de requisitos de software]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[12pt]{article}

% ============================================================================
% CONFIGURAÇÃO LATEX PARA DOCUMENTOS ACADÊMICOS EM PORTUGUÊS (ABNT)
% ============================================================================

% Codificação de entrada (UTF-8 para caracteres especiais)
\RequirePackage[utf8]{inputenc}

% ============================================================================
% CONFIGURAÇÃO DE PÁGINA E MARGENS
% ============================================================================

% Definição do tamanho do documento e margens conforme ABNT
\RequirePackage[a4paper, left=30mm, right=20mm, top=30mm, bottom=20mm]{geometry}

% ============================================================================
% FORMATAÇÃO DE TEXTO E FONTE
% ============================================================================

% Alinhamento de texto adicional (justificação aprimorada)
\RequirePackage{ragged2e}

% Fonte Times New Roman para o documento
\RequirePackage{mathptmx}

% Alternativa para Arial (comentada)
% \RequirePackage{helvet}
% \renewcommand{\familydefault}{\sfdefault}

% Suporte para hifenização
\RequirePackage{hyphenat}

% Identação do primeiro parágrafo
\RequirePackage{indentfirst}

% Espaçamento entre linhas
\RequirePackage[nodisplayskipstretch]{setspace}

% ============================================================================
% CONFIGURAÇÃO DE SEÇÕES E SUBSEÇÕES
% ============================================================================

\RequirePackage{titlesec}

% Criação de subsubsubsection (4º nível de seção)
\titleclass{\subsubsubsection}{straight}[\subsection]

% Contador para subsubsubsection
\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
\renewcommand\theparagraph{\thesubsubsubsection.\arabic{paragraph}} % opcional: útil se parágrafos forem numerados

% Formatação da subsubsubsection (inline com texto)
\titleformat{\subsubsubsection}[runin]{\normalfont\normalsize}{\thesubsubsubsection}{1em}{}
\titlespacing*{\subsubsubsection}{0pt}{1ex plus 1ex minus .2ex}{1ex plus .2ex}

% Redefinição de paragraph e subparagraph
\makeatletter
\renewcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
  
\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\parindent}%
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}

% Configuração para sumário (níveis de seção)
\def\toclevel@subsubsubsection{4}
\def\toclevel@paragraph{5}
\def\toclevel@subparagraph{6} % CORRIGIDO: era \toclevel@paragraph{6} duplicado
\def\l@subsubsubsection{\@dottedtocline{4}{7em}{4em}}
\def\l@paragraph{\@dottedtocline{5}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{6}{14em}{6em}}
\makeatother

% Profundidade de numeração e sumário (até 4 níveis)
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

% Tamanho das seções (todas em tamanho normal conforme ABNT)
\RequirePackage{sectsty}
\sectionfont{\normalsize}
\subsectionfont{\normalsize}
\subsubsectionfont{\normalsize}

% ============================================================================
% IDIOMA E LOCALIZAÇÃO
% ============================================================================

% Suporte para português brasileiro
\RequirePackage[brazil]{babel}

% ============================================================================
% FIGURAS E TABELAS
% ============================================================================

% Suporte para subfiguras
\RequirePackage{caption}
\RequirePackage{subcaption}

% Pacote para inserção de imagens
\RequirePackage{graphicx}

% Controle de posicionamento de figuras
\RequirePackage{float}

% ============================================================================
% CABEÇALHO E RODAPÉ
% ============================================================================

\RequirePackage{fancyhdr}

% Configuração do fancy para paginação
\pagestyle{fancy}
\fancyhf{} % Limpa cabeçalho e rodapé
\fancyheadoffset{0cm}
\renewcommand{\headrulewidth}{0pt} % Remove linha do cabeçalho
\renewcommand{\footrulewidth}{0pt} % Remove linha do rodapé
\fancyhead[R]{\thepage} % Número da página no canto superior direito

% Estilo para páginas especiais (como capítulos)
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[R]{\thepage}%
}

% Alteração do tamanho da linha do rodapé para notas
\renewcommand{\footnoterule}{%
\kern -3pt
\hrule width 5cm
\kern 2pt
}

% ============================================================================
% CITAÇÕES E REFERÊNCIAS
% ============================================================================

% Ambiente para citações longas
\RequirePackage{quoting}

% Referências bibliográficas em ABNT (ATENÇÃO: pode estar desatualizado)
\RequirePackage[style=abnt]{biblatex}
\addbibresource{referencias.bib}

% ============================================================================
% HYPERLINKS
% ============================================================================

\RequirePackage{hyperref}

% Configuração dos hyperlinks (todos em preto para impressão)
\hypersetup{%
    colorlinks=true,
    linkcolor=black,
    filecolor=black,      
    urlcolor=black,
    citecolor=black,
    pdfpagemode=FullScreen,
}

% Comentado no original - ativando para consistência
\urlstyle{same}

% ============================================================================
% GLOSSÁRIO E NOMENCLATURAS
% ============================================================================

% Nomenclaturas e abreviações
\RequirePackage{nomencl}
\makenomenclature

% Glossário com acrônimos
\RequirePackage[acronym]{glossaries}
\makeglossaries

% ============================================================================
% CÓDIGOS DE PROGRAMAÇÃO
% ============================================================================

\RequirePackage{listings}
\RequirePackage{xcolor}

% Definição de cores para código
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{1,1,1}

% Estilo para listagens de código
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

% ============================================================================
% MATEMÁTICA
% ============================================================================

\RequirePackage{amsmath}

% ============================================================================
% UTILITÁRIOS
% ============================================================================

% Geração de texto dummy para testes
\RequirePackage{lipsum}

% Pacote para comentários no código
\RequirePackage{comment}

% Importação de arquivos externos
\RequirePackage{import}

% Pacote para visualização de grades (útil para formatação - comentado)
% \RequirePackage[grid]{eso-pic}

% ============================================================================
% RENOMEAÇÃO DE TÍTULOS (deve ficar no final)
% ============================================================================

% Comandos que precisam ser executados após o carregamento do babel
\AtBeginDocument{%
    % Renomeação da descrição do listing para código
    \renewcommand{\lstlistingname}{Código}
    % Renomeação do título de listing para código
    \renewcommand{\lstlistlistingname}{\centering \normalsize \uppercase{Lista de Códigos}}
    % Centralização do título sumário - CORRIGIDO: de "Table of contents" para português
    \renewcommand\contentsname{\centering \normalsize \uppercase{Sumário}}
    % Renomeação do título das siglas - MELHORADO: mais descritivo
    \renewcommand{\nomname}{\centering \normalsize \uppercase{Lista de Siglas}} 
    % Remoção do título referências (será customizado)
    \renewcommand{\refname}{} 
    % Renomeação do título da lista de figuras - CORRIGIDO: capitalização
    \renewcommand{\listfigurename}{\centering \normalsize \uppercase{Lista de Figuras}}
    % Renomeação do título da lista de tabelas - CORRIGIDO: plural
    \renewcommand{\listtablename}{\centering \normalsize \uppercase{Lista de Tabelas}}
    % Configuração de enumeração aninhada para citações ABNT
    \renewcommand{\labelenumii}{\arabic{enumi}.\arabic{enumii}}
    \renewcommand{\labelenumiii}{\arabic{enumi}.\arabic{enumii}.\arabic{enumiii}}
    % CORRIGIDO: comando \renewcommand{\labelenumiv} estava incompleto - removido
}

% Formatação da bibliografia: fonte normal e texto justificado
\renewcommand*{\bibfont}{\normalfont\justifying}

% ============================================================================
% AMBIENTES PERSONALIZADOS
% ============================================================================

% Ambiente para apresentação da natureza do trabalho
\newenvironment{natureza}{%
    \hspace{59mm}\begin{minipage}[c]{95mm}\begin{justify}
}{%
    \end{justify}\end{minipage}
}

% Ambiente para citações longas (mais de três linhas)
\newenvironment{longcite}{%
    \vspace{5mm}\hfill\begin{minipage}[c]{120mm}\setstretch{1.0}\small
}{%
    \end{minipage}\vspace{5mm}
}

% ============================================================================
% COMANDOS PERSONALIZADOS
% ============================================================================

% Título do trabalho
\newcommand{\titulo}{Descrição de projeto}
\newcommand{\titulocapa}{\MakeUppercase{\titulo}}

% Nome do autor
\newcommand{\nome}{\uppercase{Nome Sobrenome}}

% Orientador
\newcommand{\orientador}{Prof. Dr. Nome Sobrenome}

% Cidade e Estado
\newcommand{\cidade}{Cidade -- Estado}

% Definição de um comando personalizado para criar tabelas de casos de uso
% Este comando facilita a criação padronizada de documentação de casos de uso
\newcommand{\usecase}[4]{
    % Inicia um ambiente centralizado para posicionar a tabela no centro da página
    \begin{center}
        % Cria uma tabela com duas colunas de larguras fixas
        % |p{4cm}|p{11cm}| define:
        % - Primeira coluna: 4cm de largura para os rótulos
        % - Segunda coluna: 11cm de largura para o conteúdo
        % As barras verticais (|) criam bordas entre as colunas
        \begin{tabular}{|p{4cm}|p{11cm}|}
            % Linha horizontal superior da tabela
            \hline
            
            % Primeira linha: Nome do caso de uso
            % #1 é o primeiro parâmetro passado ao comando
            % \textbf{} deixa o texto em negrito
            Caso de uso: & \textbf{#1} \\
            \hline
            
            % Segunda linha: Atores envolvidos
            % #2 é o segundo parâmetro
            Atores: & #2 \\
            \hline
            
            % Terceira linha: Tipo do caso de uso
            % #3 é o terceiro parâmetro
            Tipo: & #3 \\
            \hline
            
            % Quarta linha: Descrição detalhada
            % #4 é o quarto parâmetro
            Descrição: & #4 \\
            \hline
            
        \end{tabular}
    \end{center}
}

% EXEMPLO DE USO:
% \usecase{Login do Usuário}
%         {Usuário, Sistema}
%         {Primário}
%         {O usuário fornece suas credenciais para acessar o sistema}

% VANTAGENS DESTE COMANDO:
% 1. Padronização: Garante que todos os casos de uso tenham o mesmo formato
% 2. Reutilização: Pode ser usado múltiplas vezes no documento
% 3. Manutenibilidade: Mudanças no formato podem ser feitas em um só lugar
% 4. Simplicidade: Reduz a repetição de código LaTeX complexo

% PARÂMETROS:
% #1 - Nome/título do caso de uso
% #2 - Lista de atores (usuários, sistemas, etc.)
% #3 - Classificação do tipo (primário, secundário, etc.)
% #4 - Descrição detalhada do comportamento esperado

\AtBeginDocument{\setstretch{1.5}}

\endinput
