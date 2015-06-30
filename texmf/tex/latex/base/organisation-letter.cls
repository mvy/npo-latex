\NeedsTeXFormat{LaTeX2e}
% TODO: change package name
\ProvidesClass{association-letter}[2014/06/12 Yves Stadler, v1.0]

\newcommand{\lieu}[1]{\def\thelieu{#1}}
\newcommand{\name}[1]{}
\newcommand{\titre}[1]{}
\newcommand{\phone}[1]{}
\newcommand{\email}[1]{}

\makeatletter
\newif\if@personal\@personalfalse
\DeclareOption{personal}{
    \renewcommand{\name}[1]{\def\thename{#1}}
    \renewcommand{\titre}[1]{\def\thetitre{#1}}
    \renewcommand{\phone}[1]{\def\thephone{#1}}
    \renewcommand{\email}[1]{\def\themail{#1}}
    \@personaltrue 
}

\newif\if@signimg\@signimgfalse
\DeclareOption{signimg}{
    \@signimgtrue
}
\makeatother

\ProcessOptions\relax

%% Load base class
\LoadClass[NF,version=last]{scrlttr2}

%%
%% Configuration option for letters with scrlttr2 (KomaScript)
%%
\RequirePackage{adjustbox}
\KOMAoptions{foldmarks=true,foldmarks=BlmTp, backaddress=false, fromalign=left,
fromphone,fromemail,fromlogo,subject=left}
% Sender information
\makeatletter
\if@personal
% TODO: change name
    \setkomavar{fromname}{\thename{}, Association}
\else
% TODO: change name, number and email
    \setkomavar{fromname}{Association }
    \def\thephone{+33 555 555 555}
    \def\themail{info@association.org}
\fi
\makeatother

\renewcommand*{\raggedsignature}{\raggedright}
% TODO: change address
\setkomavar{fromaddress}{14-16 rue Demotti\\
38100 Grenoble}
\setkomavar{fromlogo}{%
    \adjustbox{valign=B,raise=12mm}{%
% TODO: change logo
\includegraphics{logo\editionyear}}}

% Member information
\makeatletter
\if@personal
% TODO: add name
\setkomavar{signature}{Pour l'association ,\\%
    \thetitre\\%
    \thename{}\\%
    \if@signimg%
    \includegraphics[width=.35\textwidth]{sign.png}%
    \else{}\fi%
}
\else
% TODO: change name
\setkomavar{signature}{Association}
\fi
% Set by macro above
\setkomavar{fromemail}{\themail}
\setkomavar{fromphone}{\thephone}
\makeatother

\makeatletter
\@setplength{sigindent}{.60\textwidth}
\makeatother

% vim: set ft=tex :

%% Specific configuration for letters
\RequirePackage{graphics}
\RequirePackage{scrdate}
\RequirePackage{association-common}

%% Set the date format at the start of the document
\AtBeginDocument{\setkomavar{date}{À \thelieu, le \MakeLowercase{\todaysname} \today}}

\setlength{\parskip}{10pt}
%% vim: set ft=tex:
