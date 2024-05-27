% Author: Hunter Hwang

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{responseletter}[2024/5/26 A Latex Response Letter class]
\LoadClass[]{article}

%%%%%%%%%%%%%%%%%%%%%%%% Core Package %%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[utf8]{inputenc}

% page size setting
\RequirePackage{geometry}
\geometry{
  a4paper,
  left=15mm,
  right=15mm,
  top=15mm,
  bottom=15mm,
  marginparwidth=15mm
}

% To add author blocks to the front-matter
\RequirePackage{authblk}

% Reference
\RequirePackage[style=ieee,refsection=subsection]{biblatex}
%% cite style
\DeclareFieldFormat{labelnumber}{R.#1}

% Color
\RequirePackage{xcolor}

% reference style for builtin
\renewcommand{\theequation}{R.\arabic{equation}}
\renewcommand{\thefigure}{R.\arabic{figure}}
\renewcommand{\thetable}{R.\arabic{table}}

%%%%%%%%%%%%%%%%%%%%%%%% Additonal Package %%%%%%%%%%%%%%%%%%%%%%%%%%%

% Indent first line automatically
\RequirePackage{indentfirst}

% Using [H] to ban the float of algorithm, figure and so on.
\RequirePackage{float}

% Figure
\RequirePackage{graphicx}
\RequirePackage[]{subfig}

% Math
\RequirePackage{amsmath}
\RequirePackage{amssymb}


% Algorithm
%% Float of algorithm
\RequirePackage{algorithm}
%% Body of algorithm
\RequirePackage{algorithmic}
%% Custom setting for algorithmic
\renewcommand{\algorithmicrequire}{\textbf{Input:}} 
\renewcommand{\algorithmicensure}{\textbf{Output:}}
%% cite style
\renewcommand{\thealgorithm}{R.\arabic{algorithm}}

% Code highlight
\RequirePackage{minted}

% Autoref
\RequirePackage[
  colorlinks,
  linkcolor=red,
  anchorcolor=blue,
  citecolor=green % black
]{hyperref}
%% Custom refname for algorithm
\newcommand{\algorithmautorefname}{Algorithm}
%% Custom refname for subfigure
\newcommand{\subfigureautorefname}{Figure}
%% Custom refname for section
\renewcommand{\sectionautorefname}{Section}
%% Custom refname for subsection
\renewcommand{\subsectionautorefname}{Subsection}
%% Custom refname for subsection
\renewcommand{\subsubsectionautorefname}{SubSubsection}
%% Custom refname for step of algorithm
\makeatletter
\newcommand{\ALC@uniqueautorefname}{Line}
\makeatother

% border box
\RequirePackage{framed}


%%%%%%%%%%%%%%%%%%%%%%%% Common Part of Comment %%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{Draft}{
  \ifx \IfDraft True {
}{
  }
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%% Labels %%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\Label}[2]{
  \colorbox{#1}{\color{white} \textbf{#2}}
}

\newcommand{\Hard}{
  \Label{red}{Hard}
}

\newcommand{\Medium}{
  \Label{yellow}{Medium}
}

\newcommand{\Easy}{
  \Label{green}{Easy}
}

\newcommand{\Done}{
  \Label{blue}{Done}
}

\newcommand{\InProcess}{
  \Label{cyan}{Done}
}

\newcommand{\Tip}{
  \Label{violet}{Tip}
}

%%%%%%%%%%%%%%%%%%%%%%%% Common Part of Comment %%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\renewcommand{\@seccntformat}[1]{}
\makeatother

\newenvironment{CommentSummary}{
  \subsection*{Comments to the Authors:}
  %\begin{quotation}
    \begin{em}
}{
    \end{em}
  %\end{quotation}
}

\newenvironment{Response}{
  \subsection*{Response}
}{
  \vspace{2cm}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Editors %%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{Editor}[1][Editor]{
  \section{#1}
}{
  \pagebreak
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Reviewer %%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{ReviewerCounter}
\setcounter{ReviewerCounter}{1}
\newcounter{ReviewerCommentCounter}[section]

\newenvironment{Reviewer}[1][\arabic{ReviewerCounter}]{
  \ifx #1 \empty {
    \section{Reviewer #1}
  } \else {
    \setcounter{ReviewerCounter}{#1}
    \section{Reviewer \arabic{ReviewerCounter}}
  }
  \fi
  \stepcounter{ReviewerCounter}
}{
  \pagebreak
}

\newenvironment{ReviewerComment}{
  \stepcounter{ReviewerCommentCounter}
  \subsection{Comment \Roman{ReviewerCommentCounter}}
  %\begin{quotation}
  \begin{em}
}{
  \end{em}
  %\end{quotation}
}
