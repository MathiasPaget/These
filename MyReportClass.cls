%% ==================================================================
%%  MyReportClass.cls' - a class for book reports
%%  -------------------------------------------------------------------
%%  Florentin Delaine
%%  florentin.delaine@ens-cachan.fr
%%
%%  -------------------------------------------------------------------
%%  Inspired from LMTClassReport designed by
%%  David Néron
%%  neron@lmt.ens-cachan.fr
%% ==================================================================
\def\fileversion{0.8}
\def\filedate{2014/08/04}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MyReportClass}[\filedate\space v\fileversion\space-
                          a class for book reports]
\LoadClass[11pt]{book}

% ---------------------------------------> Chargement des packages <---

\RequirePackage{geometry}          % Régler la taille de la page
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{subfiles}
\RequirePackage{amsmath,amssymb,bm}% Étendre les fonctions maths
\RequirePackage{fancybox}          % Faire de jolies boîtes
\RequirePackage{calc}              % Faire des calculs
\RequirePackage{xspace}            % Gestion automatique des espaces
\RequirePackage{fancyhdr}          % Configurer headers/footers
%\RequirePackage[center]{subfigure} % Inclusion de subfigures
\RequirePackage{subfigure} % Inclusion de subfigures
\RequirePackage{wrapfig}
\RequirePackage{array}             % Gestion des tableaux
\RequirePackage[french]{babel}    % Règles typo françaises
%\RequirePackage[english]{babel}
%\RequirePackage{soulutf8}

\RequirePackage{algorithm}
\RequirePackage{algorithmic}
%\RequirePackage{algorithmicx}

\RequirePackage{lmodern} % police

\RequirePackage[centerlast,bf]{caption} % Captions (NB : apres babel)
\RequirePackage[english]{minitoc}   % Minitocs en début de chapitre (NB : apres caption)
\RequirePackage{tocbibind}         % ToC, ToF, etc. dans la ToC

\RequirePackage{ifpdf}             % Tester si génération d'un pdf

\RequirePackage{supertabular}

\RequirePackage{enumerate}
\RequirePackage{eurosym}
\RequirePackage{fancyref}
\RequirePackage{numprint}
\RequirePackage{amsfonts}
\RequirePackage{makeidx}
\RequirePackage[binary-units = true]{siunitx} % dépend de la version de siunitx utilisée
%\RequirePackage[load-configurations=binary]{siunitx}

\RequirePackage[square]{natbib}
\RequirePackage{cancel} 

\emergencystretch=1em

% ------------------------------------------> Géométrie de la page <---

\geometry{a4paper,
          twoside,
          body={16cm,26cm},
          lmargin=2.5cm,
          rmargin=2.5cm,
          footskip=1cm,
          top=2.25cm,
 %         headsep=1cm,
 %         head=15pt
          }

% ---------------------------------------------> LaTeX ou pdfLaTeX <---

\ifpdf
   \RequirePackage[pdftex]{graphicx,color}
   \RequirePackage[pdftex]{hyperref}
   \geometry{pdftex}
\else
   \RequirePackage[dvips]{graphicx,color}
   \RequirePackage[ps2pdf]{hyperref}
   \geometry{dvips}
\fi
	      
% --------------------------------------------> Réglage d'hyperref <---

\hypersetup{a4paper=true,
            pdfstartview=FitH,
	        colorlinks=false,
	        breaklinks=true,
	        pdfborder=0 0 0}
	       
% ----------------------------------------------> siunitx <---
\sisetup{locale = FR}
%\sisetup{locale = US}

\DeclareSIUnit\px{px}

% ----------------------------------------------> drawing packages <---
\RequirePackage[europeanresistors]{circuitikz}
\RequirePackage{chemfig}

% ----------------------------------------------> fancyref <---
\renewcommand{\fancyrefdefaultformat}{plain}
%\renewcommand*{\frefeqname}{équation}
%\renewcommand*{\freftabname}{tableau}
\renewcommand*{\fancyrefargdelim}{-}

% ------------------------------------------------> toc et minitoc <---

% Réglage de la toc
\setcounter{tocdepth}{4}       % profondeur de la toc
\setcounter{secnumdepth}{4}    % profondeur de la numérotation 

% Réglage de la minitoc
\setcounter{minitocdepth}{2}
\setlength{\mtcindent}{15pt}                % indentation des minitocs
\renewcommand{\mtcfont}{\small\rm}          % fonte des minitocs
\renewcommand{\mtcSfont}{\small\bfseries}   % fonte des minitocs
\newcommand{\mtoc}{\minitoc\thispagestyle{plain}\newpage}

% Pour gérer des interférences entre minitoc et hyperref
\let\old@tableofcontents\tableofcontents
\def\tableofcontents{\old@tableofcontents\mtcaddchapter}
\let\old@listoffigures\listoffigures
\def\listoffigures{\old@listoffigures\mtcaddchapter}
\let\old@listoftables\listoftables
\def\listoftables{\old@listoftables\mtcaddchapter}

% --------------------------------------------> Quelques commandes <---

% Pour laisser un espace vertical entre deux paragraphes
\newcommand{\Par}{\bigskip\par}

% Pour que la page paire, ajoutée afin de commencer les chapitres
% sur une page impaire, soit sans header/footer
\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}%
                                   \cleardoublepage}}
                                   
% thank title
\newcommand{\thanksbloctitle}{
      \vspace*{50\p@}
      \parindent \z@ \raggedleft
     {\huge\bfseries Remerciements}
     \interlinepenalty\@M
     \vskip 20\p@
     }
                                   
% Des remerciements
\newenvironment{thanksbloc}
   {%
     \clearemptydoublepage
     \thispagestyle{empty}
     {\thanksbloctitle}
     \vfill 
     }
   {%
     \vfill\clearemptydoublepage}

% Des paragraphes encadrés
\newenvironment{parboxed}
   {%
     \setlength{\fboxsep}{10pt}
     \begin{Sbox}%
     \begin{minipage}{\linewidth-2\fboxrule-2\fboxsep}
     \setlength{\abovedisplayskip}{0pt}
     \setlength{\belowdisplayskip}{0pt}}
   {%
     \end{minipage}%
     \end{Sbox}
     \[\fbox{\TheSbox}\]\aftergroup\ignorespaces}

% Un résumé du chapitre
\newenvironment{resumechap}[1][]
   {%
     \vspace{2cm}
     \begin{center}
     \begin{minipage}{.7\linewidth}
     \centering\itshape}
   {%
     \end{minipage}
     \end{center}
     \vspace{2cm}}
     

% subsubsubsection

%\setcounter{secnumdepth}{4}
%\makeatletter
%\newcounter {subsubsubsection}[subsubsection]
%\renewcommand\thesubsubsubsection{\thesubsubsection .\@alph\c@subsubsubsection}
%\newcommand\subsubsubsection{\@startsection{subsubsubsection}{4}{\z@}%
%                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                     {1.5ex \@plus .2ex}%
%                                     {\normalfont\normalsize\bfseries}}
%\renewcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {-1em}%
%                                    {\normalfont\normalsize\bfseries}}
%\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\parindent}%
%                                       {3.25ex \@plus1ex \@minus .2ex}%
%                                       {-1em}%
%                                      {\normalfont\normalsize\bfseries}}
%\newcommand*\l@subsubsubsection{\@dottedtocline{4}{10.0em}{4.1em}}
%\renewcommand*\l@paragraph{\@dottedtocline{5}{10em}{5em}}
%\renewcommand*\l@subparagraph{\@dottedtocline{6}{12em}{6em}}
%\newcommand*{\subsubsubsectionmark}[1]{}
%\makeatother

% -----------------------------> Configuration des headers/footers <---

% Titre de bas de page
\def\lmt@foottitle{}
\newcommand{\foottitle}[1]{\def\lmt@foottitle{#1}}

% Pour une page courante : avec header et footer
\fancyhf{}
%\fancyfoot[C]{\small\itshape\lmt@foottitle}
\fancyhead[RO,LE]{\small\bfseries\thepage}
\fancyhead[LO]{\nouppercase{\small\bfseries\rightmark}}
\fancyhead[RE]{\nouppercase{\small\bfseries\leftmark}}
%\renewcommand{\footrulewidth}{.5pt}
\renewcommand{\headrulewidth}{.5pt}

% Pour une page de début de chapitre (ie de style plain) :
% avec seulement footer
\fancypagestyle{plain}{
\fancyhf{}
%\fancyfoot[C]{\small\itshape\lmt@foottitle}
%\renewcommand{\footrulewidth}{.5pt}
\renewcommand{\headrulewidth}{.0pt}}

\lfoot[\thepage]{} %gauche du pied de page
\cfoot{} %milieu du pied de page
\rfoot[]{\thepage} %droite du pied de page


%\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
%\renewcommand{\sectionmark}[1]{\markright{#1}}
%
%\pagestyle{headings}
%
%\usepackage{lastpage}
%\usepackage{fancyhdr}
%\pagestyle{fancy}
%
%\renewcommand{\headrulewidth}{0.25mm}
%\fancyhead[L]{\textsc{Commissioning of the new CTPCORE module}}
%%\fancyhead[R]{\lesauteurs}
%
%\renewcommand{\footrulewidth}{0.25mm}
%\fancyfoot[C]{\thepage / \pageref{LastPage}}
%
%\renewcommand{\headrule}{{\color[rgb]{0,0,0}%
%\hrule width\headwidth height\headrulewidth \vskip-\headrulewidth}}
%
%\renewcommand{\footrule}{{\color[rgb]{0,0,0}%
%\vskip-\footruleskip\vskip-\footrulewidth
%\hrule width\headwidth height\footrulewidth\vskip\footruleskip}}


% -----------------------------------> Configuration des chapitres <---

% Numérotation moins chargée
\renewcommand{\thesection}{\@arabic\c@section}

% Style de chapitre, esthétique pompée dans thesetb.cls
\newfont{\chapfonte}{cmr10 scaled 9000}
\def\haut{20mm}
\def\decal{1.75ex}
\newlength{\lgnamechap}
\newlength{\lgnumchap}
\newlength{\lgall}    

% Redéfinition de \chapter
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedleft \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 20\p@
  }}

% Redéfinition de \chapter*
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedleft
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }\markboth{#1}{#1}}

% Chapitre sans numéro mais qui apparait dans la ToC
\newcommand{\chapterwithnonb}[1]{\toc@chapter{#1}\mtcaddchapter}

% ------------------------------> Gestion des flottants/références <---

% Noms des flottants
%\newcommand{\Figure}{\textsc{Fig.}}
%\newcommand{\Tableau}{\textsc{Tab.}}
%\newcommand{\Algorithme}{\textsc{Alg.}}
%\newcommand{\Chapitre}{\textsc{Chap.}}


\newcommand{\argmin}{\operatornamewithlimits{argmin}}
\newcommand{\argmax}{\operatornamewithlimits{argmax}}
