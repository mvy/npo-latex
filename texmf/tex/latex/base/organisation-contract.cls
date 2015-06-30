\NeedsTeXFormat{LaTeX2e}
%% Name of the class
\ProvidesClass{organisation-contract}[2015/06/08 Yves `M'vy` `Stadler, v1.0]
%% Options

%%% Default options
\PassOptionsToClass{siret}{organisation}
%% Base class option
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{organisation}} 
\ProcessOptions\relax

%% Package
\LoadClass{organisation}
\RequirePackage{eurosym}
\RequirePackage{multicol}

%% Variables
% Contractor (Organisation)
\makeatletter
\def\ORGCTR@partA{\orgname}
\def\ORGCTR@reprA{\orgpresident}
\def\ORGCTR@addressA{\orgsinglelineaddress}
\def\ORGCTR@shortA{\orgshort}

\newcommand{\atlocation}[1]{\def\ORGCTR@location{#1}}
\newcommand{\reprA}[1]{\def\ORGCTR@reprA{#1}}

% Contractee 
\newcommand{\partB}[1]{\def\ORGCTR@nameB{#1}}
\newcommand{\reprB}[1]{\def\ORGCTR@reprB{#1}}
\newcommand{\addressB}[1]{\def\ORGCTR@addressB{#1}}
\newcommand{\shortB}[1]{\def\ORGCTR@shortB{#1}}

%% Customisation
%% Changing section into "Article X"
\usepackage{titlesec}
\titleformat{\section}[display]
{\normalfont\bfseries}
{\Large}
{0em}
{Article \thesection~-~}

%% Macros
\newcommand{\chapeau}{
{\setlength{\parindent}{0cm}
%% Cette partie formate l'introduction du contrat
Entre

{L'\textbf{\ORGCTR@partA}, dont le siège social est situé \ORGCTR@addressA,
association loi 1901 immatriculée 509 021 135 00017 au Registre du Commerce
et des Sociétés, représentée par \ORGCTR@reprA

ci-après dénommée \og \textbf{\ORGCTR@shortA} \fg}

\begin{flushright}
d'une part
\end{flushright}

et, 

{\textbf{\ORGCTR@nameB}\\
\ORGCTR@addressB,\\
représenté par \ORGCTR@reprB

ci-après dénommé \og \textbf{\ORGCTR@shortB} \fg}

\begin{flushright}
d'autre part
\end{flushright}

\textbf{Il a été convenu de ce qui suit:}
}
}


%% Environment

%% Singature block
\newcommand{\signatures}{
    {
    \setlength{\parindent}{0cm}
    \vspace{1cm}
\begin{minipage}[b][5cm]{\linewidth}

\textit{Édité en deux exemplaires originaux \ORGCTR@location{} le \today.}

\begin{multicols}{2}
Pour \ORGCTR@shortA,\\
\ORGCTR@reprA\\
Date et signature\vfill\columnbreak
Pour \ORGCTR@shortB,\\
\ORGCTR@reprB\\
Date et signature
\end{multicols}
\end{minipage}
}
}

\makeatother
\endinput
% vim: set ft=tex : 

