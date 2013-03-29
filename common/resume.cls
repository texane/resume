%% Original : Eric-Olivier Le Bigot
%% Modifs : Frédéric Meynadier (Frederic.Meynadier@obspm.fr)
%% Modifs : Dominique Quatravaux (dom@idealx.com) - conversion en
%%     classe de document.
%% 03/01/03

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}
  [2002/01/03 v0.1 Curriculum Vitae package]

\LoadClass[8pt]{article}
\RequirePackage{ifthen}
\RequirePackage{array}

   %%%%%%%%%%%%%%%%%%%%%%%%%%%
   % Mise en page par défaut %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\textwidth}{160mm}    %% Largeur de la zone texte
\setlength{\oddsidemargin}{0mm}	 %% Texte centré sur la page

\pagestyle{empty} % pour ne pas indiquer de numéro de page...

% On définit les pieds de page comme des \stretch de force 1,
% soit 4 plus fort que celui qui est en bas du chapeau
% (Cf. ci-dessous). De cette façon, un CV qui ne remplit pas toute la
% page a un bel espacement.

% Mis en commentaire par Popov

%\makeatletter
%\def\@textbottom{\vspace*{\stretch{1}}}
%\def\@textbottom{\vspace*{\stretch{4}}}
%\makeatother

  
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %      Paramètres réglables          %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% L'utilisateur peut les redéfinir ceux-ci «\renewcommand» si besoin :

% Mis en commentaire par Popov
%\newcommand{\espaceInterRubrique}{\medskip\vspace{\stretch{0.4}}}

% L'utilisateur peut les redéfinir ceux-ci «\setlength» si besoin :

\newlength{\rubriquetableauparindent}
% indentation au début d'une
% ligne de droite dans un «rubriquetableau». Cette longueur peut
% être négative, auquel cas l'alignement dans le tableau se fait
% compte tenu du retrait de la première ligne : celle-ci ne «bavera»
% pas sur l'espace réservé pour la colonne de gauche, au lieu de cela,
% l'ensemble de la colonne de droite est décalé de l'espace correspondant.

\setlength{\rubriquetableauparindent}{-16pt}


   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %     Macros pratiques       %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\er{$^{\hbox{er}}$}
\def\ere{$^{\hbox{ère}}$}
\def\eme{$^{\hbox{ème}}$}

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % L'environnement "rubrique" %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Usage : \begin{rubrique}[Indentation]{Titre} [...] \end{rubrique}
% On met le texte qu'on veut à l'intérieur.

\newenvironment{rubrique}[1]   % "rubrique" prend un seul argument, le titre
{\espaceInterRubrique\relax%
\noindent\textbf{\large #1}\par%
\noindent\rule[0.5ex]{\textwidth}{0.1mm}\par}{}

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % L'environnement "rubriquetableau" %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Il sert à rendre les tableaux, avec typiquement des dates à gauche
% et des activités à droite. Il s'utilise comme «rubrique»
% ci-dessus, sauf qu'il admet un argument optionnel qui est la largeur
% de la colonne de gauche, et que l'intérieur doit être un tableau
% LaTeX avec les «&» et les «\\» qui vont bien.
% Par exemple :
%
% \begin{rubriquetableau}[3.5cm]{pipotage}
% 1999--2000 	& ligne 1\\
% 		& ligne 2\\
% 1998--1999	& ligne 1\\
% [etc...]
% \end{rubriquetableau}
%
% Lorsqu'on omet le paramètre entre crochets, cela a pour effet
% de donner la dimension \linewidth à la première colonne (mais la
% structure reste celle d'un tableau à deux colonnes, donc ne pas oublier 
% d'écrire '\\' pour les retours à la ligne).

\makeatletter

\newlength{\@cvlenB}\newlength{\@cvlenC}

\newenvironment{rubriquetableau}[2][\linewidth]%% "rubriquetableau" 
%						% prend deux arguments
{\bgroup\rubrique{#2}%     % le second argument : titre
\setlength{\@cvlenB}{#1}%  % Le premier argument :indentation
\setlength{\@cvlenC}{\linewidth}%	       % Calculs...
\ifthenelse{\lengthtest{\rubriquetableauparindent<0pt}}
   {\addtolength{\@cvlenC}{\rubriquetableauparindent}}
   {}%
\addtolength{\@cvlenC}{-\@cvlenB}%
%%%
%%% modifs par THIERRY
%%% va jusqua la fin de la lign sur le tableau
%%% 9 ne correspond a rien, c est une valeur arbitraire qui focntionne
%%%
%\addtolength{\@cvlenC}{-9pt}%
%%%
\addtolength{\@cvlenC}{9pt}%
%%%
%%% FIN
%%%
\begin{tabular}[t]{p{\@cvlenB}!{%
   \ifthenelse{\lengthtest{\rubriquetableauparindent<0pt}}
	      {\hspace*{\rubriquetableauparindent}}
	      {}%
    %%%
    %%% modifs par THIERRY
	 %%% le parindent defini une longueur d identation ...
	 %%% 
    %}>{\setlength{\parindent}{\rubriquetableauparindent}}p{\@cvlenC}}}
	 %%%
    }>{\setlength{}{\rubriquetableauparindent}}p{\@cvlenC}}}
	 %%%
	 %%% END
	 %%%
{\end{tabular}\egroup}

\makeatother

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %    Le chapeau du CV        %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Usage:
% \begin{chapeau}
% \begin{adresse}
%	Frédéric Meynadier\\%
%	83, rue de l'Ourcq\\%
%	75\,019 Paris\\%
%	\ligne\\%
%	Tél. : 01 40 37 04 65\\%
%	E-mail : \texttt{meynadie@clipper.ens.fr}
% \end{adresse}
% \begin{etatcivil}
%	Né le 22/11/78\\
%	Nationalité Française
% \end{etatcivil}
% \end{chapeau}

\newenvironment{adresse}{%
\begin{minipage}{7cm}
%\begin{center}
}
{
%\end{center}
\end{minipage}\hfill}

\newenvironment{etatcivil}{%
\begin{minipage}{5cm}
\begin{center}
}
{\end{center}\end{minipage}}

%\newenvironment{chapeau}{%
%\def\ligne{\rule[2pt]{24pt}{1pt}}%
%\noindent\begin{minipage}{\linewidth}\hspace{-2cm}%
%}
{\end{minipage}\vspace{\stretch{0.25}}}



