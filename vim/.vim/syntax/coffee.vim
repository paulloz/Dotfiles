
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'coffee'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("coffee_fold")
  unlet coffee_fold
endif


syn keyword coffeeCommentTodo      TODO FIXME XXX TBD contained
syn match   coffeeLineComment      "\/\/.*" contains=@Spell,coffeeCommentTodo
syn match   coffeeCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  coffeeComment	       start="/\*"  end="\*/" contains=@Spell,coffeeCommentTodo
syn match   coffeeSpecial	       "\\\d\d\d\|\\."
syn region  coffeeStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=coffeeSpecial,@htmlPreproc
syn region  coffeeStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=coffeeSpecial,@htmlPreproc

syn match   coffeeSpecialCharacter "'\\.'"
syn match   coffeeNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  coffeeRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword coffeeConditional	if then else switch unless when
syn keyword coffeeRepeat	while for do in until of
syn keyword coffeeBranch	break continue
syn keyword coffeeOperator	new delete instanceof typeof not is inst and or 
syn keyword coffeeType		Array Boolean Date Function Number Object String RegExp
syn keyword coffeeStatement	return with super
syn keyword coffeeBoolean	true false on off no yes
syn keyword coffeeNull		null undefined
syn keyword coffeeIdentifier	arguments this var let
syn keyword coffeeLabel		case default
syn keyword coffeeException	try catch finally throw
syn keyword coffeeMessage	alert confirm prompt status console
syn keyword coffeeGlobal	self window top parent
syn keyword coffeeMember	document event location 
syn keyword coffeeDeprecated	escape unescape
syn keyword coffeeReserved	abstract boolean byte char class const debugger double enum export extends final float goto implements import int interface long native package private protected public short static super synchronized throws transient volatile 
syn keyword coffeeInclude       require

if exists("coffee_fold")
    syn match	coffeeFunction	"\<function\>"
    syn region	coffeeFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match coffeeSync	grouphere coffeeFunctionFold "\<function\>"
    syn sync match coffeeSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword coffeeFunction	function do
    syn match	coffeeBraces	"[{}\[\]]"
    syn match	coffeeParens	"[()]"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "javascript"
  syn sync ccomment coffeeComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink coffeeComment		Comment
  HiLink coffeeLineComment	Comment
  HiLink coffeeCommentTodo	Todo
  HiLink coffeeSpecial		Special
  HiLink coffeeStringS		String
  HiLink coffeeStringD		String
  HiLink coffeeCharacter	Character
  HiLink coffeeSpecialCharacter	coffeeSpecial
  HiLink coffeeNumber		coffeeValue
  HiLink coffeeConditional	Conditional
  HiLink coffeeRepeat		Repeat
  HiLink coffeeBranch		Conditional
  HiLink coffeeOperator		Operator
  HiLink coffeeType		Type
  HiLink coffeeStatement	Statement
  HiLink coffeeFunction		Function
  HiLink coffeeBraces		Function
  HiLink coffeeError		Error
  HiLink javaScrParenError	coffeeError
  HiLink coffeeNull		Keyword
  HiLink coffeeBoolean		Boolean
  HiLink coffeeRegexpString	String
  HiLink coffeeInclude          Include

  HiLink coffeeIdentifier	Identifier
  HiLink coffeeLabel		Label
  HiLink coffeeException	Exception
  HiLink coffeeMessage		Keyword
  HiLink coffeeGlobal		Keyword
  HiLink coffeeMember		Keyword
  HiLink coffeeDeprecated	Exception 
  HiLink coffeeReserved		Keyword
  HiLink coffeeDebug		Debug
  HiLink coffeeConstant		Label

  delcommand HiLink
endif

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

" vim: ts=8
