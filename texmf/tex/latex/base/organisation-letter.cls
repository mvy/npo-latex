\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{organisation-letter}[2014/06/12 Yves Stadler, v1.0]

% Default values
\makeatletter
\def\ORGLTTR@name{\orgshort{}}
\def\ORGLTTR@phone{\orgphone{}}
\def\ORGLTTR@mail{\orgmail{}}

\def\ORGLTTR@title{}

\newcommand{\atlocation}[1]{\def\ORGLTTR@atlocation{#1}}

% Disable if not personal
\newcommand{\name}[1]{}
\newcommand{\mtitle}[1]{}
\newcommand{\phone}[1]{}
\newcommand{\email}[1]{}
    
\newif\if@personal\@personalfalse
\DeclareOption{personal}{
    \renewcommand{\name}[1]{\def\ORGLTTR@name{#1}}
    \renewcommand{\mtitle}[1]{\def\ORGLTTR@title{#1}}
    \renewcommand{\phone}[1]{\def\ORGLTTR@phone{#1}}
    \renewcommand{\email}[1]{\def\ORGLTTR@mail{#1}}
    \@personaltrue 
}

\newif\if@signimg\@signimgfalse
\DeclareOption{signimg}{
    \@signimgtrue
}
\makeatother

%% Load base class
%% Base class option
%% 
%% Custom loading of def file
%% If the parameter matches a .def file, loads it at the end.
\DeclareOption*{
    \IfFileExists{\CurrentOption.def}{%
        \expandafter
        \AtEndOfClass
        \expandafter{%
            \expandafter\input\expandafter{\CurrentOption .def}%
        }%
    }{
        % Pass the option to article class
        \PassOptionsToClass{\CurrentOption}{scrlttr2} 
    } 
}

\ProcessOptions\relax
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
    \setkomavar{fromname}{\ORGLTTR@name{}, \orgname{}}
\else
    \setkomavar{fromname}{\upcase{\orgname{}}}
\fi
\makeatother

\renewcommand*{\raggedsignature}{\raggedright}

\setkomavar{fromaddress}{\orgaddress}
\setkomavar{fromlogo}{%
    \adjustbox{valign=B,raise=12mm}{%
\includegraphics[height=\orglogoheight]{\orglogobase\editionyear}}}

% Member information
\makeatletter
\if@personal
\setkomavar{signature}{Pour l'association,\\%
    \ORGLTTR@title\\%
    \ORGLTTR@name{}\\%
    \if@signimg%
    \includegraphics[width=.35\textwidth]{sign.png}%
    \else{}\fi%
}
\else
\setkomavar{signature}{\upcase{\orgname{}}}
\fi
% Set by macro above
\setkomavar{fromemail}{\ORGLTTR@mail{}}
\setkomavar{fromphone}{\ORGLTTR@phone{}}
\makeatother

\makeatletter
\@setplength{sigindent}{.60\textwidth}
\makeatother

% vim: set ft=tex :

%% Specific configuration for letters
\RequirePackage{graphics}
\RequirePackage{scrdate}
\RequirePackage{organisation-common}

%% Set the date format at the start of the document
\makeatletter
\def\ORGLTTR@Atlocation{\upcase{\ORGLTTR@atlocation{}}}
\AtBeginDocument{\setkomavar{date}{\ORGLTTR@Atlocation{}, le \MakeLowercase{\todaysname} \today}}
\makeatother

\setlength{\parskip}{10pt}
%% vim: set ft=tex:
