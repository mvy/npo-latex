\NeedsTeXFormat{LaTeX2e}
%% Name of the class
% TODO: change name of package
\ProvidesClass{organisation}[2014/07/01 Yves `M'vy` `Stadler, v1.0]
%% Options
% noheader allows to mask header
\DeclareOption{noheader}{
    \PassOptionsToPackage{\CurrentOption}{organisation-common}
}

% nofooter allows to mask footer
\DeclareOption{nofooter}{
    \PassOptionsToPackage{\CurrentOption}{organisation-common}
}

% samehead disables the front page special headers and footers
\DeclareOption{samehead}{
    \PassOptionsToPackage{\CurrentOption}{organisation-headers}
}

\DeclareOption{landscape}{
    \PassOptionsToPackage{\CurrentOption}{organisation-common}
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
        \PassOptionsToClass{\CurrentOption}{article} 
    } 
}
\ProcessOptions\relax
%% End of options

%% Package
\LoadClass{article}

\AtEndOfClass{\RequirePackage{organisation-common}}
\AtEndOfClass{\RequirePackage{organisation-headers}}

%% Loading graphics for logo
\RequirePackage{graphicx}
\RequirePackage{xcolor}
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
