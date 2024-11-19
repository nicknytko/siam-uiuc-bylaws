% Released under the MIT license.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ronr-bylaws}

% Base Class
\LoadClass{report}[12pt]

\ProcessOptions\relax

%Required Packages
\RequirePackage{microtype}
\RequirePackage[letterpaper,
                top=1in,
                left=1in,
                right= 1in,
                bottom=1in]{geometry}
\RequirePackage{mathptmx}
\RequirePackage{setspace}
\onehalfspacing

\RequirePackage{enumitem}
\RequirePackage[utf8]{inputenc}
\RequirePackage[normalem]{ulem}
\RequirePackage{xcolor}

\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{changepage}
\RequirePackage{parskip}

%% Title formatting
\def\partyname#1{\def\@partyname{#1}}
\def\location#1{\def\@location{#1}}
% alias longname
\def\longname{\@partyname}

% Creates the correct title
\renewcommand{\maketitle}{
    \begin{center}

        \large{\textbf{\MakeUppercase{\@partyname}}}
        \vspace{8pt}

        Rules of Procedure

        \vspace{12pt}

        As adopted on \@date

        \vspace{12pt}
    \end{center}
}

% Creates title page
\newcommand{\maketitlepage}{
\begin{titlepage}
   \begin{center}
       \vspace*{1cm}

       \Large{\textbf{\MakeUppercase{\@partyname}}}

       \vspace{0.5cm}
       Rules of Procedure


       \vspace{1.5cm}

       \vfill

       \vspace{0.8cm}


       As adopted on \@date \\

   \end{center}
\end{titlepage}
}

%%
% article title class
\titleclass\article{straight}[\part]
\titleformat{\article}[hang]{\bfseries\MakeUppercase}{Article \Roman{article}}{1.5em}{}
% cf https://tex.stackexchange.com/a/414239
\titlecontents{article}[0pt]{\normalfont\normalsize}{\thecontentslabel \quad}{}{\enspace\titlerule\contentspage}
\titlespacing*{\article}{0mm}{*4}{*2.3}[0mm]
\newcounter{article}
% \thearticle referenced by \ref
% cf https://tex.stackexchange.com/a/242264
\renewcommand\thearticle{\Roman{article}}

\makeatletter
\@addtoreset{section}{article}
\makeatother

% section title class
\titleformat{\section}[block]{\normalfont\scshape}{\S \arabic{section}}{1.5em}{}
\titlespacing*{\section}{12pt}{1ex}{1em}
% \thesection referenced by \ref
% cf https://tex.stackexchange.com/a/242264
\renewcommand{\thesection}{\arabic{section}}

%% cf https://tex.stackexchange.com/a/357861
% indentation for articles
\makeatletter
\let\xarticle\article
\renewcommand\article{\par
  \leftmargin0\p@
  \leftskip\leftmargin
  \@totalleftmargin\leftmargin\linewidth\textwidth
  \xarticle}

% indentation for sections
\let\xsection\section
\renewcommand\section{\par
  \leftmargin12\p@
  \leftskip\leftmargin
  \@totalleftmargin\leftmargin\linewidth\dimexpr\textwidth-\leftmargin\relax
  \xsection}


% description niceties
% cf https://tex.stackexchange.com/a/136187
% cf https://tex.stackexchange.com/a/137216
\setlist[description]{%
  labelwidth=60pt,
  leftmargin=!,
  font={\bfseries\scshape},
}

% Defines WHEREAS
\newcommand{\whereas}[1]{\noindent\textbf{WHEREAS:} #1;\vspace{12pt}}

% Defines Therefore
\newcommand{\therefore}{
    \noindent
    \textbf{%
        \MakeUppercase{Therefore, be it resolved that:}
    }
    \vspace{12pt}
}
