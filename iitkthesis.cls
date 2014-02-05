% iitkthesis.cls
% LaTeX Style file for the Indian Institute of Bombay Thesis Format
%   by Amey Karkare 2007/06/20
%   according to the guidelines given on the webpage 
%   http://gymkhana.iitb.ac.in/~rsf/old/formatthesis.htm
%
% Many commands copied from withesis.cls from 
% http://www.ctan.org/tex-archive/macros/latex/contrib/withesis/
%
% Revisions:
% 18/09/2007: Support for  ``External Guide'' added.
%             The changes submitted by: Anil Nair <talk2anil [AT] gmail.com> 
%=============================================================================
% Licensed under the Perl Artistic License.
% see: http://www.ctan.org/tex-archive/help/Catalogue/licenses.artistic.html
% for more info...
%=============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iitkthesis}[2012/05/31 IIT Kanpur Thesis Format]
\typeout{Document Class `iitkthesis' v0.1 <31 May 2012>}


%=============================================================================
% TBD: We need options to switch between Annual Progress Report,
%      Presynopsis, Synopsis and final thesis, and between different
%      types of reports. 
%=============================================================================
%\DeclareOption{aps}{}
%\DeclareOption{presynopsis}{}
%\DeclareOption{synopsis}{}
%\DeclareOption{thesis}{}
%\DeclareOption{dissertation}{}
%\DeclareOption{project}{}

%=============================================================================
% Pass the options to report class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% Defaults ...
\ProcessOptions

%=============================================================================
% a4paper: thesis must be printed on a4 size paper. 
% 12pt:    font size must be 12 pt
%
% As iitkthesis class is a simple extension of report class, we simply
% pass default options to report class.
% =============================================================================
\PassOptionsToClass{12pt,a4paper}{report}
\LoadClass{report}

% Advisor
\def\@advisorname{None}
\newcommand{\setguide}[1]{\def\@advisorname{#1}}
\newcommand{\setguidedept}[1]{\def\@advisordept{#1}}

% TODO: Handle case when there are multiple guides
% and coadvisor? (initialized to empty)
%\global\let\@coadvisorname\@empty
%\newcommand{\setcoguide}[1]{\def\@coadvisorname{#1}}
%\let\coguide\setcoguide %
%\newcommand{\show@coguide}{\@coadvisorname}

% and exadvisor? (initialized to empty)
%\global\let\@exadvisorname\@empty
%\newcommand{\setexguide}[1]{\def\@exadvisorname{#1}}
%\let\exguide\setexguide %
%\newcommand{\show@exguide}{\@exadvisorname}

%=============================================================================
% TITLE PAGE
%   - define \title{} \author{} \date{}
%   - The default degree is ``Unknown Degree''
%     Degree can be changed using the command \iitbdegree{}
%   - The default department is ``Unknown Department''
%     The department can be changed using the command \department{}
%   - The default document type is ``A preliminary report''
%     The document type can be changed using the command \reporttype{}
%     There are some short-cuts for \reporttype{}:
%      * for a PhD thesis, specify \thesis
%      * for a M.Tech./M.Phil./M.Des./M.S. dissertation, specify \dissertation
%      * for a DIIT/B.Tech./M.Sc.project report, specify \project
%      * for a preliminary report, specify \prelim
%   - once the above are defined, use \maketitle to generate the titlepage
%=============================================================================
\newcommand\@thesistitlemedskip{0.25in}
\newcommand\@thesistitlebigskip{0.6in}
\newcommand{\rollnum}[1]{\gdef\@rollnum{#1}}
\newcommand{\iitbdegree}[1]{\gdef\@iitbdegree{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\reporttype}[1]{\gdef\@doctype{#1}}
\newcommand{\certificatetype}[1]{\gdef\@certificatetype{#1}}

\newcommand{\thesis}{\reporttype{thesis}\certificatetype{Thesis}}
\newcommand{\dissertation}{\reporttype{dissertation}\certificatetype{Dissertation}}
\newcommand{\project}{\reporttype{project report}\certificatetype{Report}}
\newcommand{\prelim}{\reporttype{preliminary report}\certificatetype{Report}}

\gdef\@rollnum{Unknown 00000000}    % Default is Unknown 00000000
\gdef\@iitbdegree{Unknown Degree}    % Default is Unknown Degree
\gdef\@doctype{preliminary report}  % Default is a preliminary report
\gdef\@department{(Unknown Department)} % Default is Unknown

\renewcommand{\maketitle}{%
  \begin{titlepage}
%-----------------------------------------------------------------------------
% -- The thesis office doesn't like thanks on title page.  Put it in
% -- the acknowledgments.  This is here so you don't have to change
% -- your titlepage when converting from report style. -> from Purdue, but I
%        left it here since it seems compatible with UW-Madison, Eric -
%    Amey - I also left it here as IITB does not say anything about it.
%-----------------------------------------------------------------------------
    \def\thanks##1{\typeout{Warning: `thanks' deleted from thesis titlepage.}}
    \let\footnotesize\small \let\footnoterule\relax \setcounter{page}{1}
    \vspace*{0.1in}
    \begin{center}
      \vfill
      \mbox{}\\
      {\bf\expandafter\uppercase\expandafter{\Large\@title}} \\[\@thesistitlebigskip]
      {\large \textit{A \@doctype\ submitted}} \\
      {\large in Partial Fulfillment of the Requirements} \\
      {\large for the Degree of}\\[\@thesistitlemedskip]
      {\large \@iitbdegree} \\[\@thesistitlemedskip]
      {\large by} \\[\@thesistitlemedskip]
      {\large \bf \@author} \\[\@thesistitlebigskip]
      \vfill
      {\large \textit{to the}} \\
      {\large \MakeUppercase{Department of \@department}} \\%[\@thesistitlemedskip]
      {\large INDIAN INSTITUTE OF TECHNOLOGY KANPUR}\\%[\@thesistitlemedskip]
      {\large \@date}
      \vfill
    \end{center}
  \end{titlepage}
  \setcounter{footnote}{0}
}

%=============================================================================
% DEDICATION
%=============================================================================
% The dedication environment must do the following:
% - start a new page
% - center the text vertically
% - include the text in a center environment
%=============================================================================
\def\dedication{
  \newpage
  \thispagestyle{empty}    % No page number
  % \addtocounter{page}{-1}
  \chapter*{}            % Required for \vfill to work
  \thispagestyle{empty}    % No page number
  \null\vfil
  \begin{center}}
\def\enddedication{\end{center}\par\vfil\newpage}

%=============================================================================
% CERTIFICATE SHEET
% - start a new page. page 
% - center the text vertically
%=============================================================================
\newcommand\@thesiscertificatemedskip{0.2in}
\newcommand\@thesiscertificatebigskip{0.5in}
\newcommand{\makecertificate}{
  \cleardoublepage
    \begin{center}
      {\large \bf CERTIFICATE}\\[\@thesiscertificatebigskip]
    \end{center}
    It is certified that the work contained in the \@doctype\ titled
% FIXME: my/our should be chosen based on multiple guides or not.
     \textbf{\@title}, by \textbf{\@author}, has been carried out under my
     supervision and that this work has not been submitted elsewhere for a degree.\\[\@thesiscertificatebigskip]
    \begin{flushright}
    \rule{6cm}{1sp} \\
    \@advisorname \\
    \@advisordept \\
    IIT Kanpur 
% FIXME: Add more blocks if more guides.
    \end{flushright}

    \begin{flushleft}
    \@date
    \end{flushleft}
%change ends    
}

%=============================================================================
% ABSTRACT
%=============================================================================
% The abstract should begin with two single-spaced lines describing
% the author and title in a standard format.  After these lines comes
% the standard abstract.
%=============================================================================
\def\abstract{
    \cleardoublepage
    \begin{center}
      {\large \bf ABSTRACT}\\[\@thesiscertificatebigskip]
      Name of student: \textbf{\@author}\hspace{1 cm}Roll no: \textbf{\@rollnum} \\
      Degree for which submitted: \textbf{\@iitbdegree} \\
      Department: \textbf{\@department} \\
      Thesis title: \textbf{\@title} \\
    \end{center}
    \begin{singlespace}
% FIXME: Fix for multiple guides.        
      Name of Thesis Supervisor: \textbf{\@advisorname}
    \end{singlespace}
    Month and year of thesis submission: \textbf{\@date} \\
    \vspace{1 cm} \\
}    
\def\endabstract{\par\newpage}

%=============================================================================
% COPYRIGHTPAGE
% The copyright must do the following:
% - start a new page with no number
% - place the copyright text centered at the bottom.
%=============================================================================
\def\copyrightpage{
  \newpage
  \thispagestyle{empty}    % No page number
  % \addtocounter{page}{-1}
  \chapter*{}            % Required for \vfill to work
  \begin{center}
   \vfill
   \copyright\ Copyright by \@author\ \@date\\
   All Rights Reserved
  \end{center}}


%=============================================================================
% GLOSSARY
%=============================================================================
% The glossary environment must do the following:
% - produce the table of contents entry for the glossary
% - start a new page with GLOSSARY centered two inches from the top
%=============================================================================
\def\glossary{
  \chapter*{Glossary}
  \addcontentsline{toc}{chapter}{Glossary}}
\def\endglossary{\par\newpage}

%=============================================================================
% NOMENCLATURE
%=============================================================================
% The nomenclature environment must do the following:
% - produce the table of contents entry for the nomenclature section
% - start a new page with NOMENCLATURE centered two inches from the top
%=============================================================================
\def\nomenclature{ 
  \chapter*{Nomenclature}
  \addcontentsline{toc}{chapter}{Nomenclature}}
\def\endnomenclature{\par\newpage}

%=============================================================================
% LIST OF SYMBOLS
%=============================================================================
% The list of symbols environment must do the following:
% - produce the table of contents entry for the list of symbols section
% - start a new page with LIST OF SYMBOLS centered two inches from the top
%=============================================================================
\def\listofsymbols{
  \chapter*{List of Symbols}
  \addcontentsline{toc}{chapter}{List of Symbols}}
\def\endlistofsymbols{\par\newpage}

%=============================================================================
% VITA
%=============================================================================
% The vita environment must do the following:
% - produce a separator page with the word vita centered
% - produce the table of contents entry for the vita
% - start a new page with VITA centered two inches from the top
%=============================================================================
\def\vita{
  \chapter*{Vita}
  \addcontentsline{toc}{chapter}{Vita}}
\def\endvita{\par\newpage}

%=============================================================================
% ACKNOWLEDGMENTS
%=============================================================================
% The acknowledgments environment must do the following:
% - start a new page with ACKNOWLEDGMENTS centered two inches from the top
%=============================================================================
\def\acknowledgments{
  \chapter*{Acknowledgements}
  \thispagestyle{empty}}
\def\endacknowledgments{%
  \par\newpage}

%=============================================================================
% LIST OF FIGURES; LIST OF TABLES
%  These macros from report.cls have been modified to add entry in the
%  Contents table
%=============================================================================
\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
    \addcontentsline{toc}{chapter}{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
    \addcontentsline{toc}{chapter}{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
%=============================================================================
% These commands can be used in the thesis to switch between single
% and double spacing.  This is needed, for instance, in the abstract.
%=============================================================================

%=============================================================================
% Finally set margins per the IITK format
%=============================================================================

\usepackage[top=25mm, outer=25mm, bottom=25mm, inner=35mm]{geometry}

% Header/spacing options
\usepackage{fancyhdr}
\usepackage{setspace}
\doublespacing

\fancyhf{}
\renewcommand{\headrulewidth}{0pt} % remove the header rule
\rhead{\thepage}

\pagestyle{fancy}

% This is done with the titlesec package
\usepackage{titlesec}
\assignpagestyle{\chapter}{empty}

\usepackage{emptypage}

%=============================================================================
% END FILE
%=============================================================================
