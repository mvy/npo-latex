\NeedsTeXFormat{LaTeX2e}
%% Name of the class
% TODO: change name of package
\ProvidesClass{association}[2014/07/01 Yves `M'vy` `Stadler, v1.0]
%% Options
% noheader allows to mask header
\DeclareOption{noheader}{
    \PassOptionsToPackage{\CurrentOption}{association-common}
}

% nofooter allows to mask footer
\DeclareOption{nofooter}{
    \PassOptionsToPackage{\CurrentOption}{association-common}
}

% samehead disables the front page special headers and footers
\DeclareOption{samehead}{
    \PassOptionsToPackage{\CurrentOption}{fancyhdr-std}
}

\DeclareOption{landscape}{
    \PassOptionsToPackage{\CurrentOption}{association-common}
    \PassOptionsToPackage{\CurrentOption}{article}
}

% samehead disables the front page special headers and footers
\makeatletter
\newif\if@notitle\@notitlefalse
\DeclareOption{notitle}{
    \@notitletrue
}
\makeatother

%% Base class option
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} 
\ProcessOptions\relax

%% Package
\LoadClass{article}
% TODO: change name
\RequirePackage{association-common}
%% Default pagestyle + last page management
\RequirePackage{fancyhdr,lastpage}
\usepackage{fancyhdr-std}

%% Loading graphics for logo
\RequirePackage{graphicx}
\graphicspath{{images/}}

%% Macros
\makeatletter
\def\@subtitle{}
\newcommand{\subtitle}[1]{\def\@subtitle{#1\\}}
\makeatother

\newcommand\dotspace[1]{\parbox[b]{#1}{\dotfill}}

%% New title style
\makeatletter
\if@notitle\def\maketitle{}\else
\def\maketitle{%
    \vspace{1cm}
\begin{center}%
\begin{minipage}{.95\linewidth}
    \center\LARGE\textbf{\@title}\\
    \large\@subtitle
    \large\@author
\end{minipage}
\end{center}%
\vspace{1cm}%
}
\fi
\makeatother

%% First page style

\endinput
% vim: set ft=tex : 
