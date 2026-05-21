\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bjutthesis}[2022/12/30 By WangPeiKe]

% base settings for cls file
\LoadClass[UTF8,scheme=plain,zihao=-4,linespread=0.8]{ctexbook}
\ctexset{
  punct = quanjiao,
  space = true,
  autoindent = true,
  today = old,
}

% k-v settings
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family = bjut,
  prefix = bjut@,
  setkeys = \kvsetkeys,
}

% font settings
\RequirePackage[T1]{fontenc}
\PassOptionsToPackage{no-math}{fontspec}
% IMPORTANT
\RequirePackage[nofontspec]{newtxtext}
\RequirePackage{mathptmx}
\RequirePackage{color}
\RequirePackage{colortbl}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{newtxmath}
\RequirePackage{mathtools}
\DeclareSymbolFont{cmsymbols}{OMS}{cmsy}{m}{n}
\SetSymbolFont{cmsymbols}{bold}{OMS}{cmsy}{b}{n}
\DeclareSymbolFontAlphabet{\mathcal}{cmsymbols}

\newcommand\bjut@fontset{\csname g__ctex_fontset_tl\endcsname}
% TODO windows font config
\setCJKfamilyfont{song}{SimSun}[Path=assets/fonts/,Extension=.ttc,AutoFakeBold=1.75]
\setCJKfamilyfont{hei}{SimHei}[Path=assets/fonts/,Extension=.ttf,AutoFakeBold=1.75]
\setCJKfamilyfont{kai}{Kaiti}[Path=assets/fonts/,Extension=.ttf,AutoFakeBold=1.75]
\setCJKfamilyfont{fang}{FangSong}[Path=assets/fonts/,Extension=.ttf,AutoFakeBold=4.5]
\setCJKfamilyfont{li}{Lishu}[Path=assets/fonts/,Extension=.ttf,AutoFakeBold=1.75]

\renewcommand{\songti}{\CJKfamily{song}}
\renewcommand{\heiti}{\CJKfamily{hei}}
\renewcommand{\kaishu}{\CJKfamily{kai}}
\renewcommand{\fangsong}{\CJKfamily{fang}}
\providecommand{\lishu}{}
\renewcommand{\lishu}{\CJKfamily{li}}


\xeCJKsetup{CJKspace=true}
\AtBeginDocument{\songti}

%\renewcommand{\baselinestretch}{1.3}

% 组内往届毕业生封面部分英文数字使用了加粗黑体
% 这与规范文件不符，又足内毕业生的模版均为古早毕业生流传下来的word版本
% 姑且以为他们全都错了。

%\xeCJKDeclareCharClass{CJK}{`0 -> `9}
%\xeCJKDeclareCharClass{CJK}{`A -> `Z}
%行距由 \@setfontsize\normalsize{12bp}{18bp}%的18定义
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{18bp}%
  \abovedisplayskip=5bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\belowdisplayskip
}

\def\bjut@def@fontsize#1#2{
  \expandafter\newcommand\csname #1 \endcsname[1][1.3]{
  \fontsize{#2}{##1\dimexpr #2}\selectfont}
}


% layout
\RequirePackage{geometry}

%TODO check
\geometry{
  a4paper,
  hcentering,
  ignoreall,
  nomarginpar,
  headheight = 5.0mm,
  headsep = 5.5mm,
  top = 30.0mm,
  bottom = 25.0mm,
  left = 25.0mm,
  right = 25.0mm,
  footskip = 8.5mm
}

% page styles
\def\bjut@header@text{北京工业大学毕业设计（论文）}
\def\bjut@header@font{\zihao{3}\lishu}
\RequirePackage{fancyhdr}

\fancypagestyle{bjut@headings}{
  \fancyhead{}
  \fancyhead[C]{\bjut@header@font\bjut@header@text} % 设置居中页眉，显示为固定文本
  \fancyfoot{}
  \fancyfoot[C]{\zihao{-5}\thepage} % 设置页脚中间的页码
  \renewcommand{\headrulewidth}{0.4pt} % 设置页眉下方横线的宽度
  \renewcommand{\footrulewidth}{\z@} % 设置页脚横线的宽度为 0，即不显示
}


\renewcommand\frontmatter{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{bjut@headings}
}

\renewcommand\mainmatter{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{bjut@headings}
}

\renewcommand\backmatter{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagestyle{bjut@headings}
}

% number
\renewcommand{\theparagraph}{(\arabic{paragraph})}
\renewcommand{\theequation}{\thechapter.\arabic{equation}}
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}

% caption
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage[list=off]{bicaption}

\captionsetup{font=small, labelsep=space, format=hang}
\captionsetup[figure]{name=图}
\captionsetup[table]{name=表}
\captionsetup{font=small, labelsep=space, format=hang}



% cross references
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\InputIfFileExists{styles/cleveref.cfg}{}{}
\hypersetup{
  bookmarksnumbered  = true,
  bookmarksopen      = true,
  bookmarksopenlevel = 1,
  breaklinks         = true,
  colorlinks         = false,
  plainpages         = false,
  pdfborder          = 0 0 0
}
\urlstyle{same}

% item
\RequirePackage[shortlabels]{enumitem}
\setlist[itemize]{wide=2\ccwd}
\setlist[enumerate]{label=(\arabic*), wide=2\ccwd, labelsep=.5\ccwd}
\setlist[enumerate,2]{label=\arabic*), wide=4\ccwd, labelsep=.5\ccwd, leftmargin=2\ccwd}
\setlist[description]{wide=2\ccwd}
\setlist{nosep}

% equation
\RequirePackage{tabularx}
\setlength\belowdisplayskip{.5ex}
\NewDocumentEnvironment{where}{O{式中：}}{
    #1\tabularx{\textwidth-\widthof{#1}}[t]{@{}r@{~——~}X@{}}%
}{\endtabularx\\[.5ex]}

% table
\RequirePackage{styles/bitoc}
\RequirePackage[titles]{tocloft}
\setcounter{tocdepth}{2}

% ToC
\tocloftpagestyle{bjut@headings}

% dotline: shape and seperation
\renewcommand\cftdot{$\cdot$}
\renewcommand\cftdotsep{0}
% pagenumber width
\cftsetpnumwidth{1\ccwd}
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
% list of figures/tables
\renewcommand{\cftfigpresnum}{图~}
\setlength{\cftfignumwidth}{3.25\ccwd}
\renewcommand{\cfttabpresnum}{表~}
\setlength{\cfttabnumwidth}{3.25\ccwd}

% chapter entries
\renewcommand{\cftchapfont}{\zihao{-4}\heiti}
\setlength\cftbeforechapskip{\z@}

\renewcommand{\cftchapaftersnumb}{}
\renewcommand{\cftchapdotsep}{0}

% section entries
\setlength\cftsecindent{1.5\ccwd}
\setlength\cftsecnumwidth{1.5\ccwd}
\renewcommand{\cftsecaftersnumb}{}

% subsection entries
\setlength\cftsubsecindent{3\ccwd}
\setlength\cftsubsecnumwidth{2\ccwd}
\renewcommand{\cftsubsecaftersnumb}{}

% bibliography
\RequirePackage[sort&compress]{gbt7714}
\bibliographystyle{styles/gbt7714-numerical}
\setcitestyle{numbers,super,square,comma,sort&compress}
\renewcommand\bibfont{\zihao{5}}
\addtolength\bibsep{-3.5mm}


% pages
\RequirePackage[pagecolor=white,nopagecolor=white]{pagecolor}
\RequirePackage[copies]{contour}
\RequirePackage[normalem]{ulem}
\RequirePackage{ragged2e}
\contourlength{2pt}
\setlength\RaggedRightParindent{0pt}
\setlength\JustifyingParindent{0pt}

\RequirePackage{styles/ezinfo}
\RequirePackage{xcolor}
% TODO check
\definecolor{bjut@color@official}{RGB}{0,150,195}

% TODO 专业学位
\definecolor{bjut@color@coverbg}{RGB}{6,146,190}

\RequirePackage{graphicx}
\RequirePackage{tabularx}
\providecommand{\bjutcoverTitleLineA}{请填写论文题目第一行}
\providecommand{\bjutcoverTitleLineB}{请填写论文题目第二行}
\providecommand{\bjutcoverAuthor}{请填写姓名}
\providecommand{\bjutcoverStudentId}{请填写学号}
\providecommand{\bjutcoverSupervisor}{请填写指导教师}
\providecommand{\bjutcoverDate}{请填写日期}
\providecommand{\bjutstateDate}{\bjutcoverDate}

\newcommand{\makecover}{
  \begin{titlepage}
  \newgeometry{left=10mm,right=10mm,top=50mm}
    \begin{center}
      \includegraphics[width=10.8cm]{assets/headbjut.png}
      \vskip 1.6cm
      \contour[20]{white}{
        \makebox[14.6cm][s]{\fontsize{70}{0}\lishu\bfseries 毕业论文}
      }
    \end{center}
    \vskip 3cm
  \begin{center}\LARGE\heiti
  \renewcommand\arraystretch{1.6}
  \vspace{0mm}
  \hspace*{0mm}
  \begin{minipage}{135mm}
    \begin{tabularx}{\textwidth}{@{}r@{}X@{}}
  \makebox[30mm][s]{题目}      & \underline{\makebox[115mm][c]{\bjutcoverTitleLineA}} \\[22pt]
  \makebox[30mm][s]{}          & \underline{\makebox[115mm][c]{\bjutcoverTitleLineB}} \\[22pt]
  \makebox[30mm][s]{姓名}      & \underline{\makebox[115mm][c]{\bjutcoverAuthor}} \\[22pt]
  \makebox[30mm][s]{学号}      & \underline{\makebox[115mm][c]{\bjutcoverStudentId}} \\[22pt]
  \makebox[30mm][s]{指导教师}  & \underline{\makebox[115mm][c]{\bjutcoverSupervisor}} \\[22pt]
  \makebox[30mm][s]{日期}      & \underline{\makebox[115mm][c]{\bjutcoverDate}} \\[22pt]
\end{tabularx}

  \end{minipage}
\end{center}\normalsize

  \end{titlepage}
  \restoregeometry
  \nopagecolor
  \global\let\makecover\relax
  %\let\cleardoublepage\clearpage
}


% 内封
\usepackage{ragged2e}
\usepackage{booktabs}







\newcommand{\makestate}{
  \begin{titlepage}
       \mbox{}
    \vskip .5cm
    \begin{center}
    \hspace*{-30mm}
      \makebox[6.5cm][s]{\zihao{2}\heiti\bfseries 毕业设计（论文）诚信声明书}
    \end{center}
    \vskip 0.1cm
    \linespread{1.08}\selectfont
    {\justifying
  \hspace{2\ccwd}本人郑重声明：在毕业设计（论文）工作中严格遵守学校有关规定，恪守学术规范； 所提交的论文是我个人在导师指导下独立研究、撰写的成果，毕业设计（论文）中所引用他人的文字、研究成果，均已在毕业设计（论文）中加以说明；在本人的毕业生设计（论文）中未剽窃、抄袭他人的学术观点、思想和成果，未篡改实验数据。
  
  \hspace{2\ccwd}本毕业设计（论文）和资料若有不实之处，本人愿承担一切相关责任。}

    \begin{center}
      \renewcommand\arraystretch{1.75}
      \setlength\tabcolsep{0pt}
      \hspace*{58mm}
      \begin{tabular}{r@{}p{18mm}@{：}p{38mm}@{}l@{}l@{}p{38mm}}
        & \makebox[18mm][s]{学生签名} & \rule[-2mm]{37mm}{.4pt}
        & \multicolumn{1}{r@{：}}{日期} & \rule[-2mm]{37mm}{.4pt}
      \end{tabular}
    \end{center}


    \vfill
    \begin{center}
    \hspace*{-20mm}
      \makebox[6.5cm][s]{\zihao{2}\heiti\bfseries 关于论文使用授权的说明}
    \end{center}
    {\justifying
      \hspace{2\ccwd}本人完全了解北京工业大学有关保留、使用学位论文的规定，即：学校有权保留送交论文的复印件，允许论文被查阅和借阅；学校可以公布论文的全部或部分内容，可以采用影印、缩印或其他复制手段保存论文。\par
    \vskip 0.1cm
      \RaggedRight
      \hspace{2\ccwd}（保密的论文在解密后应遵守此规定）}
      \vspace{10mm}
      
        \begin{tabular}{@{}p{8mm}@{：}p{30mm}@{}p{18mm}@{：}p{35mm}@{}p{8mm}@{：}p{40mm}@{}}
      
      \makebox[8mm][l]{签名} & \rule[-2mm]{30mm}{.4pt} &
      \makebox[18mm][r]{导师签名} & \rule[-2mm]{35mm}{.4pt} &
      \makebox[8mm][r]{日期} & \underline{\makebox[40mm][c]{\bjutstateDate}} \\
    \end{tabular}
    \vfill
  \end{titlepage}
  \global\let\makestate\relax
}

\setcounter{secnumdepth}{4}
\def\bjut@chapter@font{\zihao{-2}\heiti}
\def\bjut@section@font{\zihao{-3}\heiti}
\def\bjut@subsection@font{\zihao{4}\heiti}
\def\bjut@subsubsection@font{\zihao{-4}\heiti}
\def\bjut@subsubsubsection@font{\zihao{-4}\heiti}
\let\subsubsubsection\paragraph
\setlength{\parskip}{\z@}

\ctexset {
  chapter = {
    beforeskip   = \z@,
    afterskip    = 36bp,
    fixskip      = false,
    indent       = \z@,
    format       = \bjut@chapter@font\centering,
    name         = {,.},
    nameformat   = {},
    titleformat  = {},
    numberformat = {},
    number       = \arabic{chapter},
    aftername    = \hspace{\ccwd},
    afterindent  = true,
    aftertitle   = {},
    pagestyle    = bjut@headings
  },
  section = {
    beforeskip   = \z@,
    afterskip    = \z@,
    indent       = \z@,
    format       = \bjut@section@font\raggedright,
    aftername    = \hspace{\ccwd},
    afterindent  = true
  },
  subsection = {
    beforeskip   = \z@,
    afterskip    = \z@,
    indent       = \z@,
    format       = \bjut@subsection@font\raggedright,
    aftername    = \hspace{\ccwd},
    afterindent  = true
  },
  subsubsection = {
    beforeskip   = \z@,
    afterskip    = \z@,
    indent       = \z@,
    format       = \bjut@subsubsection@font\raggedright,
    aftername    = \hspace{\ccwd},
    afterindent  = true
  },
  paragraph = {
    beforeskip   = \z@,
    afterskip    = \z@,
    indent       = \z@,
    format       = \bjut@subsubsubsection@font\raggedright,
    aftername    = \hspace{\ccwd},
    afterindent  = true
  },
}

\AtBeginDocument{
  \pagestyle{empty}}

\RequirePackage{titlesec}

\titlespacing{\section}{0pt}{16pt}{10pt}
\titlespacing{\subsection}{0pt}{16pt}{10pt}

\RequirePackage{fancyvrb}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{setspace}
\RequirePackage{amsmath}
\RequirePackage{chngcntr}
\counterwithin*{algorithm}{chapter}
\captionsetup[algorithm]{labelfont=rm,labelsep=colon}
\renewcommand\thealgorithm{\thechapter-\arabic{algorithm}}
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{输入：}
\renewcommand{\algorithmicensure}{输出：}

\setlength{\textfloatsep}{1em}

\newcommand{\citen}[1]{\hspace{0.15ex}\nocite{#1}[\kern-0.35em\citenum{#1}\kern-0.05em]\hspace{-0.03em}}
