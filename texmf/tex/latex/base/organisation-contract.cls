\NeedsTeXFormat{LaTeX2e}
%% Name of the class
% TODO: change name of package
\ProvidesClass{association-contract}[2015/06/08 Yves `M'vy` `Stadler, v1.0]
%% Options

%%% Default options
\PassOptionsToClass{siret}{association}
%% Base class option
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{association}} 
\ProcessOptions\relax

%% Package
% TODO: change name
\LoadClass{association}
\RequirePackage{eurosym}
\RequirePackage{multicol}

%% Variables
% Partie A [Prologin]
\newcommand{\nameA}{\orgname}
\newcommand{\personA}{\orgpresident}
\newcommand{\shortA}{\orgshort}

% Partie B
\newcommand{\nameB}{Crocus Café}
\newcommand{\addressee}{24 rue Pasteur,\\94270 le Kremlin-Bicêtre}
\newcommand{\personB}{M. Foutel}
\newcommand{\shortB}{Crocus Café}

% Liste des dates
\newcommand{\datedebut}{42 juillet 2024 à 12h00}
\newcommand{\datefin}{42 août 2024 à 12h00}
\newcommand{\datelimite}{42 juillet 2024 à 12h00}
\newcommand{\datedevis}{42 juillet 2024}
\newcommand{\datepaiement}{42 juillet 2024}
\newcommand{\somme}{3000}

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

{L'\textbf{Association Prologin}, dont le siège social est situé 14-16 rue
    Voltaire,
94270 Le Kremlin-Bicêtre, association loi 1901 immatriculée 509 021 135 00017 au
Registre du Commerce et des Sociétés, représentée par \personA

ci-après dénommée \og \textbf{\shortA} \fg}

\begin{flushright}
d'une part
\end{flushright}

et, 

{\textbf{\nameB}\\
\addressee,\\
représenté par \personB

ci-après dénommé \og \textbf{\shortB} \fg}

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

\textit{Édité en deux exemplaires originaux au Kremlin-Bicêtre le \today.}

\begin{multicols}{2}
Pour \shortA,\\
\personA\\
Date et signature\vfill\columnbreak
Pour \shortB,\\
\personB\\
Date et signature
\end{multicols}
}
}


\endinput
% vim: set ft=tex : 

