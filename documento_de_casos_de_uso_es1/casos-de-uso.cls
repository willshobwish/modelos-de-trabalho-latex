% Classe do documento de casos de uso.
% Esta classe reúne a configuração visual e os comandos antes mantidos em .sty.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{casos-de-uso}[2026/10/25 Documento de casos de uso]

% Repassa opções adicionais de \documentclass à classe article.
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

% Controla o espaçamento entre linhas sem ampliar o espaço das equações exibidas.
\RequirePackage[nodisplayskipstretch]{setspace}
% Aplica espaçamento de 1,5 linha ao conteúdo do documento.
\AtBeginDocument{\setstretch{1.5}}

% ============================================================================
% CONFIGURAÇÃO DE SEÇÕES E SUBSEÇÕES
% ============================================================================

% Cria e formata o quarto nível de seção usado nos requisitos.
\RequirePackage{titlesec}

% Criação de subsubsubsection (4º nível de seção)
\titleclass{\subsubsubsection}{straight}[\subsection]

% Contador para subsubsubsection
\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
\renewcommand\theparagraph{\thesubsubsubsection.\arabic{paragraph}}

% Formatação da subsubsubsection
\titleformat{\subsubsubsection}[runin]{\normalfont\normalsize\bfseries}{\thesubsubsubsection}{1em}{}
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
\def\toclevel@subparagraph{6} % CORRIGIDO: era paragraph novamente
\def\l@subsubsubsection{\@dottedtocline{4}{7em}{4em}}
\def\l@paragraph{\@dottedtocline{5}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{6}{14em}{6em}}
\makeatother

% Profundidade de numeração e sumário
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

% Ajusta o tamanho dos títulos de seção, subseção e subsubseção.
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

% Personaliza legendas de figuras e tabelas.
\RequirePackage{caption}
% Permite subfiguras com legendas próprias.
\RequirePackage{subcaption}

% Pacote para inserção de imagens
\RequirePackage{graphicx}

% Disponibiliza a opção [H] para fixar figuras e tabelas no local indicado.
\RequirePackage{float}

% ============================================================================
% CABEÇALHO E RODAPÉ
% ============================================================================

% Personaliza cabeçalhos e rodapés, incluindo a paginação à direita.
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

% Fornece um ambiente configurável para blocos de citação.
\RequirePackage{quoting}

% Referências bibliográficas em ABNT
\RequirePackage[style=abnt]{biblatex}
\addbibresource{referencias.bib}

% ============================================================================
% HYPERLINKS
% ============================================================================

% Cria links internos, URLs clicáveis e metadados de navegação no PDF.
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

% Estilo das URLs igual ao texto
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

% Formata blocos de código com numeração e quebra de linha.
\RequirePackage{listings}
% Define as cores usadas pelo estilo das listagens de código.
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

% Acrescenta ambientes e comandos para expressões matemáticas.
\RequirePackage{amsmath}

% ============================================================================
% UTILITÁRIOS
% ============================================================================

% Geração de texto dummy para testes
\RequirePackage{lipsum}

% Permite omitir blocos inteiros de texto com o ambiente comment.
\RequirePackage{comment}

% Inclui seções em arquivos externos com caminhos relativos preservados.
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
    % Centralização do título sumário
    \renewcommand\contentsname{\centering \normalsize \uppercase{Sumário}} % CORRIGIDO: português
    % Renomeação do título das siglas
    \renewcommand{\nomname}{\centering \normalsize \uppercase{Lista de Siglas}} % CORRIGIDO
    % Remoção do título referências (será customizado)
    \renewcommand{\refname}{}
    % Renomeação do título da lista de figuras
    \renewcommand{\listfigurename}{\centering \normalsize \uppercase{Lista de Figuras}}
    % Renomeação do título da lista de tabelas
    \renewcommand{\listtablename}{\centering \normalsize \uppercase{Lista de Tabelas}} % CORRIGIDO: plural
    % Configuração de enumeração aninhada
    \renewcommand{\labelenumii}{\arabic{enumi}.\arabic{enumii}}
    \renewcommand{\labelenumiii}{\arabic{enumi}.\arabic{enumii}.\arabic{enumiii}}
    % CORRIGIDO: comando incompleto removido
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

% ============================================================================
% COMANDOS PERSONALIZADOS PARA DOCUMENTAÇÃO DE CASOS DE USO
% ============================================================================

% ----------------------------------------------------------------------------
% COMANDO: \usecase - Caso de uso básico com 4 parâmetros
% ----------------------------------------------------------------------------
% Uso: \usecase{Nome}{Atores}{Tipo}{Descrição}
% Cria uma tabela padronizada para casos de uso simples
\newcommand{\usecase}[4]{%
    \begin{center}
        \begin{tabular}{|p{2.2cm}|p{12cm}|}
            \hline
            Caso de uso: & \textbf{#1} \\ % #1 = Nome do caso de uso (em negrito)
            \hline
            Atores:      & #2 \\          % #2 = Atores envolvidos
            \hline
            Tipo:        & #3 \\          % #3 = Tipo (Primário/Secundário/etc.)
            \hline
            Descrição:   & #4 \\          % #4 = Descrição detalhada
            \hline
        \end{tabular}
    \end{center}
}

% ----------------------------------------------------------------------------
% COMANDO: \expandedusecase - Caso de uso expandido com 6 parâmetros
% ----------------------------------------------------------------------------
% Uso: \expandedusecase{Nome}{Atores}{Finalidade}{Visão geral}{Tipo}{Referências}
% Versão mais detalhada para casos de uso complexos
\newcommand{\expandedusecase}[6]{%
    \begin{center}
        \begin{tabular}{|p{4cm}|p{11cm}|}
            \hline
            Caso de uso: & \textbf{#1} \\        % #1 = Nome do caso de uso
            \hline
            Atores:      & #2 \\                 % #2 = Atores envolvidos
            \hline
            Finalidade:  & #3 \\                 % #3 = Objetivo/Finalidade
            \hline
            Visão geral: & #4 \\                 % #4 = Resumo do caso de uso
            \hline
            Tipo:        & #5 \\                 % #5 = Classificação do tipo
            \hline
            Referências cruzadas: & #6 \\        % #6 = Links para outros casos/requisitos
            \hline
        \end{tabular}
    \end{center}
}

% ----------------------------------------------------------------------------
% COMANDOS PARA SEQUENCIAMENTO DE PASSOS
% ----------------------------------------------------------------------------

% COMANDO: \newsequence - Inicia uma nova sequência numerada
% Uso: \newsequence{nomecontador}{descrição do passo}
% Cria um novo contador e exibe o primeiro passo
\newcommand{\newsequence}[2]{%
    \newcounter{#1}             % Cria contador com nome #1
    \stepcounter{#1}            % Incrementa o contador para 1
    \arabic{#1}. #2             % Exibe: "1. descrição"
    \stepcounter{#1}            % Incrementa para próximo uso (fica em 2)
}

% COMANDO: \incsequence - Continua sequência existente
% Uso: \incsequence{nomecontador}{descrição do passo}
% Usa contador existente para continuar numeração
\newcommand{\incsequence}[2]{%
    \arabic{#1}. #2             % Exibe número atual do contador + descrição
    \stepcounter{#1}            % Incrementa contador para próximo passo
}

% ----------------------------------------------------------------------------
% COMANDO: \sequencediagram - Tabela para diagramas de sequência
% ----------------------------------------------------------------------------
% Uso: \sequencediagram{conteúdo das linhas usando \diagramline}
% Cria tabela padronizada para interações ator-sistema
\newcommand{\sequencediagram}[1]{%
    \begin{table}[H]                    % [H] força posição exata (requer float)
        \centering
        \begin{tabular}{|p{7.5cm}|p{7.5cm}|}  % Duas colunas de largura igual
            \hline
            \textbf{Ação do ator} & \textbf{Resposta do sistema} \\
            #1                      % Conteúdo inserido aqui
            \hline
        \end{tabular}
    \end{table}
}

% COMANDO: \diagramline - Linha individual do diagrama de sequência
% Uso: \diagramline{ação do ator}{resposta do sistema}
% Adiciona uma linha com separador no diagrama
\newcommand{\diagramline}[2]{%
    \hline                      % Linha horizontal de separação
    #1 & #2 \\                 % Ação do ator | Resposta do sistema
}

% ----------------------------------------------------------------------------
% AMBIENTE: hide - Oculta seções mas mantém numeração
% ----------------------------------------------------------------------------
% Uso: \begin{hide} conteúdo \end{hide}
% Útil para estruturar documento sem mostrar certas seções
\newenvironment{hide}%
{%
    % Redefine comandos de seção para apenas incrementar contadores
    \renewcommand\section[1]{\refstepcounter{section}}%
    \renewcommand\subsection[1]{\refstepcounter{subsection}}%
    \renewcommand\subsubsection[1]{\refstepcounter{subsubsection}}%
    \renewcommand\subsubsubsection[1]{\refstepcounter{subsubsubsection}}%
}%
{}  % Nada especial no fim do ambiente

% ============================================================================
% EXEMPLOS DE USO DOS COMANDOS
% ============================================================================

% % Exemplo 1: Caso de uso básico
% \usecase{Emissão de certificados para participantes em cursos ou palestras}
%         {Usuário}
%         {Primário}
%         {O usuário que participar de um curso ou palestra pode emitir o certificado
%          através de uma requisição no sistema.

%          O certificado é emitido somente para aqueles que participaram integralmente
%          de todas as partes do curso ou palestra. No certificado deve listar o nome
%          do evento, nome do ministrante(s) ou palestrante(s), data, hora, carga
%          horária e autenticação digital do coordenador do evento.}

% % Exemplo 2: Caso de uso para grandes eventos
% \usecase{Emissão de certificado de participação para usuários que participaram de grandes eventos}
%         {Usuário}
%         {Primário}
%         {O Usuário que participou de um grande evento pode realizar uma requisição
%          ao sistema para obter o certificado dos cursos e palestras que participou.

%          São considerados apenas os cursos e palestras na qual o Usuário participou
%          integralmente de todas as suas respectivas partes. No certificado é listado
%          apenas aqueles que participou, em cada evento descrito no certificado deve
%          possuir: o nome do evento, nome do ministrante(s) ou palestrante(s), data,
%          hora, carga horária.

%          No certificado deve conter uma autenticação digital do coordenador do evento.}

% % Exemplo 3: Uso do ambiente hide para estruturar requisitos
% \begin{hide}
%     \setcounter{section}{2}  % Define numeração da seção como 2
%     \section{Specific requirements}
%     \subsection{Funcionais}
%         \subsubsection{Certificado}
%             \subsubsubsection{O sistema deve emitir certificados com o nome do
%                 participante, o tipo de evento que participou com o nome, ministrante
%                 ou palestrante, data, hora, e carga horária. Caso seja evento grande,
%                 será listado apenas aqueles que o usuário participou, com as datas,
%                 horário, carga horária e uma autenticação digital.}\label{c1}

%             \subsubsubsection{O sistema deve emitir certificados para ministrantes
%                 ou palestrantes após a realização do evento com as seguintes informações:
%                 nome do evento, data, hora, carga horária, tipo de evento, local, nome
%                 do coordenador do evento e uma autenticação digital.}\label{c2}

%             \subsubsubsection{O sistema deve emitir certificados, ou listar a
%                 participação de em um curso dentro de um grande evento, apenas para
%                 aqueles que participaram integralmente de todas as partes de cursos
%                 (caso seja mais que uma parte).}\label{c3}

%             \subsubsubsection{Deve registrar e armazenar o nome e o diretório que
%                 está armazenado para a reemissão futura, também o registro da data
%                 e horário da emissão.}\label{c4}

%             \subsubsubsection{O sistema deve entregar o certificado em formato de PDF.}\label{c5}
% \end{hide}
