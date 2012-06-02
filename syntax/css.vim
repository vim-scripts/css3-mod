" Vim syntax file
" Language:	CSS 3
" Original Author: lepture <sopheryoung@gmail.com> , 
" Claudio Fleiner <claudio@fleiner.com>
" Modify By: fremff <claffar@hotmail.com>
" Last Change:	Jun 2, 2012

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'css'
endif

syn case ignore

syn keyword cssTagName abbr acronym address applet area a b base
syn keyword cssTagName basefont bdo big blockquote body br button
syn keyword cssTagName caption center cite code col colgroup dd del
syn keyword cssTagName dfn dir div dl dt em fieldset font form frame
syn keyword cssTagName frameset h1 h2 h3 h4 h5 h6 head hr html img i
syn keyword cssTagName iframe img input ins isindex kbd label legend li
syn keyword cssTagName link map menu meta noframes noscript ol optgroup
syn keyword cssTagName option p param pre q s samp script select small
syn keyword cssTagName span strike strong style sub sup tbody td
syn keyword cssTagName textarea tfoot th thead title tr tt ul u var
syn match cssTagName "\<table\>"
syn match cssTagName "\*"

syn match cssTagName "@page\>" nextgroup=cssDefinition

syn match cssSelectorOp "[+>.]"
syn match cssSelectorOp2 "[~|]\?=" contained
syn region cssAttributeSelector matchgroup=cssSelectorOp start="\[" end="]" transparent contains=cssUnicodeEscape,cssSelectorOp2,cssStringQ,cssStringQQ

try
syn match cssIdentifier "#[A-Za-zÀ-ÿ_@][A-Za-zÀ-ÿ0-9_@-]*"
catch /^.*/
syn match cssIdentifier "#[A-Za-z_@][A-Za-z0-9_@-]*"
endtry


syn match cssMedia "@media\>" nextgroup=cssMediaType skipwhite skipnl
syn keyword cssMediaType contained screen print aural braile embosed handheld projection ty tv all nextgroup=cssMediaComma,cssMediaBlock skipwhite skipnl
syn match cssMediaComma "," nextgroup=cssMediaType skipwhite skipnl
syn region cssMediaBlock transparent matchgroup=cssBraces start='{' end='}' contains=cssTagName,cssError,cssComment,cssDefinition,cssURL,cssUnicodeEscape,cssIdentifier

syn match cssValueInteger contained "[-+]\=\d\+"
syn match cssValueNumber contained "[-+]\=\d\+\(\.\d*\)\="
syn match cssValueLength contained "[-+]\=\d\+\(\.\d*\)\=\(%\|mm\|cm\|in\|pt\|pc\|em\|ex\|px\)"
syn match cssValueAngle contained "[-+]\=\d\+\(\.\d*\)\=\(deg\|grad\|rad\)"
syn match cssValueTime contained "+\=\d\+\(\.\d*\)\=\(ms\|s\)"
syn match cssValueFrequency contained "+\=\d\+\(\.\d*\)\=\(Hz\|kHz\)"

syn match cssFontDescriptor "@font-face\>" nextgroup=cssFontDescriptorBlock skipwhite skipnl
syn region cssFontDescriptorBlock contained transparent matchgroup=cssBraces start="{" end="}" contains=cssComment,cssError,cssUnicodeEscape,cssFontProp,cssFontAttr,cssCommonAttr,cssStringQ,cssStringQQ,cssFontDescriptorProp,cssValue.*,cssFontDescriptorFunction,cssUnicodeRange,cssFontDescriptorAttr
syn match cssFontDescriptorProp contained "\<\(unicode-range\|unit-per-em\|panose-1\|cap-height\|x-height\|definition-src\)\>\(:\)\@="
syn keyword cssFontDescriptorProp contained src stemv stemh slope ascent descent widths bbox baseline centerline mathline topline
syn keyword cssFontDescriptorAttr contained all
syn region cssFontDescriptorFunction contained matchgroup=cssFunctionName start="\<\(uri\|url\|local\|format\)\s*(" end=")" contains=cssStringQ,cssStringQQ oneline keepend
syn match cssUnicodeRange contained "U+[0-9A-Fa-f?]\+"
syn match cssUnicodeRange contained "U+\x\+-\x\+"

syn keyword cssColor contained aqua black blue fuchsia gray green lime maroon navy olive purple red silver teal yellow
" FIXME: These are actually case-insensitive too, but (a) specs recommend using
" mixed-case (b) it's hard to highlight the word `Background' correctly in
" all situations
syn case match
syn keyword cssColor contained ActiveBorder ActiveCaption AppWorkspace ButtonFace ButtonHighlight ButtonShadow ButtonText CaptionText GrayText Highlight HighlightText InactiveBorder InactiveCaption InactiveCaptionText InfoBackground InfoText Menu MenuText Scrollbar ThreeDDarkShadow ThreeDFace ThreeDHighlight ThreeDLightShadow ThreeDShadow Window WindowFrame WindowText Background
syn case ignore
syn match cssColor contained "\<transparent\>"
syn match cssColor contained "\<white\>"
syn match cssColor contained "#[0-9A-Fa-f]\{3\}\>"
syn match cssColor contained "#[0-9A-Fa-f]\{6\}\>"
"syn match cssColor contained "\<rgb\s*(\s*\d\+\(\.\d*\)\=%\=\s*,\s*\d\+\(\.\d*\)\=%\=\s*,\s*\d\+\(\.\d*\)\=%\=\s*)"
syn region cssURL contained matchgroup=cssFunctionName start="\<url\s*(" end=")" oneline keepend
syn region cssFunction contained matchgroup=cssFunctionName start="\<\(clip\|attr\|counter\|rect\)\s*(" end=")" oneline keepend

syn match cssImportant contained "!\s*important\>"

syn keyword cssCommonAttr contained auto none inherit
syn keyword cssCommonAttr contained top bottom
syn keyword cssCommonAttr contained medium normal

syn match cssFontProp contained "\<font\(-\(family\|style\|variant\|weight\|size\(-adjust\)\=\|stretch\)\)\=\>\(:\)\@="
syn match cssFontAttr contained "\<\(sans-\)\=\<serif\>"
syn match cssFontAttr contained "\<small\(-\(caps\|caption\)\)\=\>"
syn match cssFontAttr contained "\<x\{1,2\}-\(large\|small\)\>"
syn match cssFontAttr contained "\<message-box\>"
syn match cssFontAttr contained "\<status-bar\>"
syn match cssFontAttr contained "\<\(\(ultra\|extra\|semi\|status-bar\)-\)\=\(condensed\|expanded\)\>"
syn keyword cssFontAttr contained cursive fantasy monospace italic oblique
syn keyword cssFontAttr contained bold bolder lighter larger smaller
syn keyword cssFontAttr contained icon menu
syn match cssFontAttr contained "\<caption\>"
syn keyword cssFontAttr contained large smaller larger
syn keyword cssFontAttr contained narrower wider

syn keyword cssColorProp contained color
syn keyword cssColorAttr contained center scroll fixed
syn match cssColorAttr contained "\<repeat\(-[xy]\)\=\>"
syn match cssColorAttr contained "\<no-repeat\>"

syn match cssTextProp "\<\(\(word\|letter\)-spacing\|text\(-\(decoration\|transform\|align\|index\|shadow\)\)\=\|vertical-align\|unicode-bidi\|line-height\)\>\(:\)\@="
syn match cssTextAttr contained "\<line-through\>"
syn match cssTextAttr contained "\<text-indent\>"
syn match cssTextAttr contained "\<\(text-\)\=\(top\|bottom\)\>"
syn keyword cssTextAttr contained underline overline blink sub super middle
syn keyword cssTextAttr contained capitalize uppercase lowercase center justify baseline sub super

syn match cssBoxProp contained "\<\(margin\|padding\|border\)\(-\(top\|right\|bottom\|left\)\)\=\>\(:\)\@="
syn match cssBoxProp contained "\<border-\(\(\(top\|right\|bottom\|left\)-\)\=\(width\|color\|style\)\)\=\>\(:\)\@="
syn match cssBoxProp contained "\<\(width\|z-index\)\>\(:\)\@="
syn match cssBoxProp contained "\<\(min\|max\)-\(width\|height\)\>\(:\)\@="
syn keyword cssBoxProp contained width height float clear overflow clip visibility
syn keyword cssBoxAttr contained thin thick both
syn keyword cssBoxAttr contained dotted dashed solid double groove ridge inset outset
syn keyword cssBoxAttr contained hidden visible scroll collapse

syn keyword cssGeneratedContentProp contained content quotes
syn match cssGeneratedContentProp contained "\<counter-\(reset\|increment\)\>\(:\)\@="
syn match cssGeneratedContentProp contained "\<list-style\(-\(type\|position\|image\)\)\=\>\(:\)\@="
syn match cssGeneratedContentAttr contained "\<\(no-\)\=\(open\|close\)-quote\>"
syn match cssAuralAttr contained "\<lower\>"
syn match cssGeneratedContentAttr contained "\<\(lower\|upper\)-\(roman\|alpha\|greek\|latin\)\>"
syn match cssGeneratedContentAttr contained "\<\(hiragana\|katakana\)\(-iroha\)\=\>"
syn match cssGeneratedContentAttr contained "\<\(decimal\(-leading-zero\)\=\|cjk-ideographic\)\>"
syn keyword cssGeneratedContentAttr contained disc circle square hebrew armenian georgian
syn keyword cssGeneratedContentAttr contained inside outside

syn match cssPagingProp contained "\<page\(-break-\(before\|after\|inside\)\)\=\>\(:\)\@="
syn keyword cssPagingProp contained size marks inside orphans widows
syn keyword cssPagingAttr contained landscape portrait crop cross always avoid

syn keyword cssUIProp contained cursor
syn match cssUIAttr contained "\<[ns]\=[ew]\=-resize\>"
syn keyword cssUIAttr contained default crosshair pointer move wait help
syn keyword cssUIAttr contained thin thick
syn keyword cssUIAttr contained dotted dashed solid double groove ridge inset outset
syn keyword cssUIAttr contained invert

syn match cssRenderAttr contained "\<marker\>"
syn match cssRenderProp contained "\<\(display\|marker-offset\|unicode-bidi\|white-space\|list-item\|run-in\|inline-table\)\>\(:\)\@="
syn keyword cssRenderProp contained position top bottom direction
syn match cssRenderProp contained "\<\(left\|right\)\>"
syn keyword cssRenderAttr contained block inline compact
syn match cssRenderAttr contained "\<table\(-\(row-gorup\|\(header\|footer\)-group\|row\|column\(-group\)\=\|cell\|caption\)\)\=\>"
syn keyword cssRenderAttr contained static relative absolute fixed
syn keyword cssRenderAttr contained ltr rtl embed bidi-override pre nowrap
syn match cssRenderAttr contained "\<bidi-override\>"


syn match cssAuralProp contained "\<\(pause\|cue\)\(-\(before\|after\)\)\=\>\(:\)\@="
syn match cssAuralProp contained "\<\(play-during\|speech-rate\|voice-family\|pitch\(-range\)\=\|speak\(-\(punctuation\|numerals\)\)\=\)\>\(:\)\@="
syn keyword cssAuralProp contained volume during azimuth elevation stress richness
syn match cssAuralAttr contained "\<\(x-\)\=\(soft\|loud\)\>"
syn keyword cssAuralAttr contained silent
syn match cssAuralAttr contained "\<spell-out\>"
syn keyword cssAuralAttr contained non mix
syn match cssAuralAttr contained "\<\(left\|right\)-side\>"
syn match cssAuralAttr contained "\<\(far\|center\)-\(left\|center\|right\)\>"
syn keyword cssAuralAttr contained leftwards rightwards behind
syn keyword cssAuralAttr contained below level above higher
syn match cssAuralAttr contained "\<\(x-\)\=\(slow\|fast\)\>"
syn keyword cssAuralAttr contained faster slower
syn keyword cssAuralAttr contained male female child code digits continuous

syn match cssTableProp contained "\<\(caption-side\|table-layout\|border-collapse\|border-spacing\|empty-cells\|speak-header\)\>\(:\)\@="
syn keyword cssTableAttr contained fixed collapse separate show hide once always

" FIXME: This allows cssMediaBlock before the semicolon, which is wrong.
syn region cssInclude start="@import" end=";" contains=cssComment,cssURL,cssUnicodeEscape,cssMediaType
syn match cssBraces contained "[{}]"
syn match cssError contained "{@<>"
syn region cssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape
syn match cssBraceError "}"

syn match cssPseudoClass ":\S*" contains=cssPseudoClassId,cssUnicodeEscape,cssClassName,cssSelectorOp2,cssSelectorOp,cssStringQQ,cssTagName,cssBracketsValue
syn keyword cssPseudoClassId contained link visited active hover focus before after left right
syn match cssPseudoClassId contained "\<first\(-\(line\|letter\|child\)\)\=\>"
syn region cssPseudoClassLang matchgroup=cssPseudoClassId start=":lang(" end=")" oneline

syn region cssComment start="/\*" end="\*/" contains=@Spell

syn match cssUnicodeEscape "\\\x\{1,6}\s\?"
syn match cssSpecialCharQQ +\\"+ contained
syn match cssSpecialCharQ +\\'+ contained
syn region cssStringQQ start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cssUnicodeEscape,cssSpecialCharQQ
syn region cssStringQ start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=cssUnicodeEscape,cssSpecialCharQ
syn match cssClassName "\.[A-Za-z][A-Za-z0-9_-]\+"



" HTML 5 tags
syn keyword cssTagName article aside audio bb canvas command datagrid
syn keyword cssTagName datalist details dialog figure footer
syn keyword cssTagName header hgroup keygen mark meter nav output
syn keyword cssTagName progress time ruby rt rp section time video

" HTML 5 Attribute
syn keyword cssCommonAttr contained contenteditable contextmenu draggable item
syn keyword cssCommonAttr contained itemprop list subject spellcheck dropzone 
" User-interface
syn match cssUIProp contained "\<nav-\(index\|up\|right\|down\|left\)\>\(:\)\@="
syn keyword cssUIProp contained resize outline
" Other modules
syn match cssBoxProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)column\(-\(width\|span\|rule\|gap\|fill\|count\)\)\=\>\(:\)\@="
syn match cssBoxProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)column-rule-\(color\|width\|style\)\>\(:\)\@="
syn match cssBoxProp contained "\<column-break-\(after\|before\)\>\(:\)\@="

syn keyword cssColorProp contained opacity

syn match cssGeneratedContentProp contained "\<background\(-\(origin\|clip\|repeat\|color\|image\|attachment\|position\)\)\=\>\(:\)\@=\(:\)\@="

syn match cssTextProp contained "\<break-word\>\(:\)\@="
syn match cssTextProp contained "\<break-all\>\(:\)\@="
syn match cssBoxProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)border-\(image\|radius\)\>\(:\)\@="
syn match cssBoxProp contained "\<border-\(bottom\|top\)-\(left\|right\)-radius\>\(:\)\@="



syn keyword cssTagName source figcaption bdi wbr summary track 

syn match cssTextProp contained "\<text-\(justify\|\outline\|shadow\|overflow\|warp\|indent\)\>\(:\)\@=" 
syn match cssRenderProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)transform\(-\(origin\|style\)\)\=\>\(:\)\@="
syn match cssTextProp contained "\<word-\(break\|\wrap\)\>\(:\)\@="
syn match cssRenderProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)transition\(-\(delay\|duration\|property\|timing-function\)\)\=\>\(:\)\@="

syn match cssRenderAttr contained "\<linear\>"
syn match cssRenderAttr contained "\<ease\(-\(in-out\|out\|in\)\)\=\>"
syn match cssRenderAttr contained "\<cubic-bezier\>"
syn match cssRenderAttr contained "\<infinite\>"
syn match cssCommonAttr contained "\(-\(moz\|webkit\|ms\|o\)-\|\)initial\>"
syn keyword cssBoxAttr contained content-box padding-box border-box manual
syn keyword cssBoxAttr contained horizontal vertical inline-axis block-axis 
syn keyword cssBoxAttr contained start end stretch reverse 

syn match cssBoxProp contained "\<marquee\(-\(direction\|play-count\|speed\|style\)\)\=\>\(:\)\@="
syn match cssBoxProp contained "\<overflow-\(x\|y\|style\)\>\(:\)\@="
syn match cssBoxProp contained "\<perspective\(-origin\)\=\>\(:\)\@="
syn match cssRenderProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)animation\(-\(fill-mode\|direction\|name\|duration\|timing-function\|delay\|iteration-cout\|play-state\)\)\=\>\(:\)\@="
syn match cssUIProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)appearance\>\(:\)\@="
syn match cssBoxProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)box-\(align\|direction\|flex\|ordinal-group\|orient\|pack\|shadow\|sizing\)\>\(:\)\@="

syn match cssPseudoClassId contained "\<\(last\|only\|nth\|nth-last\)-child\>"
syn match cssPseudoClassId contained "\<\(first\|last\|only\|nth\|nth-last\)-of-type\>"

syn match cssBoxProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)border-\(\(top\|right\|bottom\|left\)-colors\)\>\(:\)\@="
syn match cssBoxProp contained "\<border-image-\(source\|width\|repeat\|outset\|slice\)\>\(:\)\@="
syn match cssBoxProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)\(\(margin\|padding\|border\)-\(end\|start\)\)\>\(:\)\@="
syn match cssBoxProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)perspective\(-\(origin\)\)\=\>\(:\)\@="
syn match cssTextProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)text-align-last\>\(:\)\@="
syn match cssTextProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)text-decoration-\(line\|color\|style\)\>\(:\)\@="
syn match cssBoxProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)hyphens\>\(:\)\@="
syn match cssFontProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)font-feature-settings\>\(:\)\@="
syn match cssBoxProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)backface-visibility\>\(:\)\@="
syn match cssGeneratedContentProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)background-inline-policy\>\(:\)\@="
syn match cssBoxProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)binding\>\(:\)\@="
syn match cssBoxProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)orient\>\(:\)\@="
syn match cssUIProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)outline-radius\(-\(bottomleft\|bottomright\|topleft\|topright\)\)\=\>\(:\)\@="
syn match cssUIProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)outline\(-\(width\|style\|offset\|color\)\)\=\>\(:\)\@="
syn match cssTextProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)text-blink\>\(:\)\@="
syn match cssUIProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)user-\(focus\|input\|modify\|Select\)\>\(:\)\@="
syn match cssRenderProp contained "\<filter\>\(:\)\@="
syn match cssGeneratedContentProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)background\(-\(origin\|clip\|size\)\)\=\>\(:\)\@="
syn match cssGeneratedContentProp contained "\(-\(moz\|webkit\|ms\|o\)-\|\)image-region\>\(:\)\@="
syn match cssBoxProp contained "\<mask\>\(:\)\@="
syn match cssBoxProp contained "\<clip-path\>\(:\)\@="
syn match cssUIProp contained "\<pointer-events\>\(:\)\@="

syn match cssBracketsValue "(\@<=\d\+\()\)\@="

syn region cssColor contained start="\<\(rgb\|rgba\|hsl\|hsla\)\s*("ms=e+1 end=")"me=s-1 oneline
"syn region cssColor contained matchgroup=cssFunctionName start="\<\(rgb\|rgba\|hsl\|hsla\)\s*(" end=")" oneline keepend
"syn region cssFunction contained matchgroup=cssFunctionName start="\<\(linear\|radial\)-gradient\s*(" end=")" oneline keepend
"syn region cssFunction contained matchgroup=cssFunctionName start="\<-moz-image-rect\s*(" end=")" oneline keepend
"syn region cssFunction contained matchgroup=cssFunctionName start="\<\(matrix\(3d\)\=\|scale\(3d\|X\|Y|\Z\)\=\|translate\(3d\|X\|Y|\Z\)\=\|skew\(X\|Y\)\=\|rotate\(3d\|X\|Y|\Z\)\=\)\s*(" end=")" oneline keepend


if main_syntax == "css"
  syn sync minlines=10
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_css_syn_inits")
  if version < 508
    let did_css_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cssComment Comment
  HiLink cssTagName Statement
  HiLink cssSelectorOp Special
  HiLink cssSelectorOp2 Special
  HiLink cssFontProp StorageClass
  HiLink cssColorProp StorageClass
  HiLink cssTextProp StorageClass
  HiLink cssBoxProp StorageClass
  HiLink cssRenderProp StorageClass
  HiLink cssAuralProp StorageClass
  HiLink cssRenderProp StorageClass
  HiLink cssGeneratedContentProp StorageClass
  HiLink cssPagingProp StorageClass
  HiLink cssTableProp StorageClass
  HiLink cssUIProp StorageClass
  HiLink cssFontAttr Type
  HiLink cssColorAttr Type
  HiLink cssTextAttr Type
  HiLink cssBoxAttr Type
  HiLink cssRenderAttr Type
  HiLink cssAuralAttr Type
  HiLink cssGeneratedContentAttr Type
  HiLink cssPagingAttr Type
  HiLink cssTableAttr Type
  HiLink cssUIAttr Type
  HiLink cssCommonAttr Type
  HiLink cssPseudoClassId PreProc
  HiLink cssPseudoClassLang Constant
  HiLink cssValueLength Number
  HiLink cssValueInteger Number
  HiLink cssValueNumber Number
  HiLink cssValueAngle Number
  HiLink cssValueTime Number
  HiLink cssValueFrequency Number
  HiLink cssFunction Constant
  HiLink cssURL String
  HiLink cssFunctionName Function
  HiLink cssColor Constant
  HiLink cssIdentifier Function
  HiLink cssInclude Include
  HiLink cssImportant Special
  HiLink cssBraces Function
  HiLink cssBraceError Error
  HiLink cssError Error
  HiLink cssInclude Include
  HiLink cssUnicodeEscape Special
  HiLink cssStringQQ String
  HiLink cssStringQ String
  HiLink cssMedia Special
  HiLink cssMediaType Special
  HiLink cssMediaComma Normal
  HiLink cssFontDescriptor Special
  HiLink cssFontDescriptorFunction Constant
  HiLink cssFontDescriptorProp StorageClass
  HiLink cssFontDescriptorAttr Type
  HiLink cssUnicodeRange Constant
  HiLink cssClassName Function
  HiLink cssBracketsValue Number
  delcommand HiLink
endif


let b:current_syntax = "css"

if main_syntax == 'css'
  unlet main_syntax
endif
