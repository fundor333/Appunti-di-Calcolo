% This document class provides a simple memo for LaTeX users.
% It is based on article.cls and inherits most of the functionality
% that class.
% 
% Author: Rob Oakes, Copyright 2010.  Released under the LGPL, version 3.
% A copy of the LGPL can be found at http://www.gnu.org/licenses/lgpl.html

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texMemo}[2010/07/31 - Simple Memo Class, Including Logo]
\RequirePackage{palatino}

\usepackage{graphicx}

% Load the Base Classlectionof
\LoadClassWithOptions{article}

% Begin Requirements
\RequirePackage{ifthen}

% Specialized memo Commands (To, From, Subject, Logo, Letterhead Address)

\def\@lectionof{\relax}
\newcommand{\lectionof}[1]{\gdef\@lectionof{#1}}

\def\@lectionteacher{\relax}
\newcommand{\lectionteacher}[1]{\gdef\@lectionteacher{#1}}

\def\@lectionsubject{\relax}
\newcommand{\lectionsubject}[1]{\gdef\@lectionsubject{#1}}

\def\@lectiondate{\relax}
\newcommand{\lectiondate}[1]{\gdef\@lectiondate{#1}}

\def\@memologo{\relax}
\newcommand{\logo}[1]{\gdef\@memologo{\protect #1}}

\def\@letterheadaddress{\relax}
\newcommand{\lhaddress}[1]{\gdef\@letterheadaddress{#1}}

% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par
}

% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=1.0in}

% Create the Letterhead and To/From Block

\renewcommand{\maketitle}{\makememotitle}
\newcommand\makememotitle{
	\ifthenelse{\equal{\@memologo}{\relax}}{}
	{ % Create With Logo
	\begin{minipage}[t]{1\columnwidth}%
		\begin{flushright}
			\vspace{-0.6in}
			\@memologo
			\vspace{0.5in}
		\par\end{flushright}%
	\end{minipage}
	}
	% To, From, Subject Block
	\begin{description}
		\ifthenelse{\equal{\@lectionof}{\relax}}{}{\item [{Lezione di }] \@lectionof}
		\ifthenelse{\equal{\@lectionteacher}{\relax}}{}{\item [{Tenuta da }] \@lectionteacher}
		\ifthenelse{\equal{\@lectionsubject}{\relax}}{}{\item [{Argomento della lezione}] \@lectionsubject}
		\ifthenelse{\equal{\@lectiondate}{\relax}}{}{\item [{Data }] \@lectiondate}
	\end{description}
	\decorativeline\bigskip{}
}