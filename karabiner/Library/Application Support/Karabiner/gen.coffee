
keyCodes = {
	a: "KeyCode::A"
	b: "KeyCode::B"
	c: "KeyCode::C"
	d: "KeyCode::D"
	e: "KeyCode::E"
	f: "KeyCode::F"
	g: "KeyCode::G"
	h: "KeyCode::H"
	i: "KeyCode::I"
	j: "KeyCode::J"
	k: "KeyCode::K"
	l: "KeyCode::L"
	m: "KeyCode::M"
	n: "KeyCode::N"
	o: "KeyCode::O"
	p: "KeyCode::P"
	q: "KeyCode::Q"
	r: "KeyCode::R"
	s: "KeyCode::S"
	t: "KeyCode::T"
	u: "KeyCode::U"
	v: "KeyCode::V"
	w: "KeyCode::W"
	x: "KeyCode::X"
	y: "KeyCode::Y"
	z: "KeyCode::Z"
	"`": "KeyCode::BACKQUOTE"
	"~": "KeyCode::BACKQUOTE, ModifierFlag::SHIFT_L"
	1: "KeyCode::KEY_1"
	"!": "KeyCode::KEY_1, ModifierFlag::SHIFT_L"
	2: "KeyCode::KEY_2"
	"@": "KeyCode::KEY_2, ModifierFlag::SHIFT_L"
	3: "KeyCode::KEY_3"
	"#": "KeyCode::KEY_3, ModifierFlag::SHIFT_L"
	4: "KeyCode::KEY_4"
	"$": "KeyCode::KEY_4, ModifierFlag::SHIFT_L"
	5: "KeyCode::KEY_5"
	"%": "KeyCode::KEY_5, ModifierFlag::SHIFT_L"
	6: "KeyCode::KEY_6"
	"^": "KeyCode::KEY_6, ModifierFlag::SHIFT_L"
	7: "KeyCode::KEY_7"
	"&": "KeyCode::KEY_7, ModifierFlag::SHIFT_L"
	8: "KeyCode::KEY_8"
	"*": "KeyCode::KEY_8, ModifierFlag::SHIFT_L"
	9: "KeyCode::KEY_9"
	"(": "KeyCode::KEY_9, ModifierFlag::SHIFT_L"
	0: "KeyCode::KEY_0"
	")": "KeyCode::KEY_0, ModifierFlag::SHIFT_L"
	"-": "KeyCode::MINUS"
	"_": "KeyCode::MINUS, ModifierFlag::SHIFT_L"
	"=": "KeyCode::EQUAL"
	"+": "KeyCode::EQUAL, ModifierFlag::SHIFT_L"
	"": "KeyCode::DELETE"
	"\t": "KeyCode::TAB"
	"\x0F": "KeyCode::VK_STICKY_SHIFT_L"
	"\x11": "KeyCode::VK_STICKY_CONTROL_L"
	"\x12": "KeyCode::VK_STICKY_COMMAND_L"
	"[": "KeyCode::BRACKET_LEFT"
	"]": "KeyCode::BRACKET_RIGHT"
	"{": "KeyCode::BRACKET_LEFT, ModifierFlag::SHIFT_L"
	"}": "KeyCode::BRACKET_RIGHT, ModifierFlag::SHIFT_L"
	"\\": "KeyCode::SLASH"
	"|": "KeyCode::SLASH, ModifierFlag::SHIFT_L"
	"'": "KeyCode::QUOTE"
	"\"": "KeyCode::QUOTE, ModifierFlag::SHIFT_L"
	";": "KeyCode::SEMICOLON"
	":": "KeyCode::SEMICOLON, ModifierFlag::SHIFT_L"
	".": "KeyCode::DOT"
	">": "KeyCode::DOT, ModifierFlag::SHIFT_L"
	",": "KeyCode::COMMA"
	"<": "KeyCode::COMMA, ModifierFlag::SHIFT_L"
	"/": "KeyCode::BACKSLASH"
	"?": "KeyCode::BACKSLASH, ModifierFlag::SHIFT_L"
	"\n": "KeyCode::RETURN"
}

mappings = {
	"q": "a"
	"w": "s"
	"e": "e"
	"r": "t"
	"t": "["
	"y": "]"
	"u": "n"
	"i": "i"
	"o": "o"
	"p": "p"
	"[": ""
	"]": "\n"
	"n": "\x0F"

	"qw": "w"
	"qe": "x"
	"qr": "f"
	"qu": "q"
	"qi": "!"
	"qo": "'"
	"qp": ")"

	"wq": "q"
	"we": "d"
	"wr": "c"
	"wu": "j"
	"wi": "z"
	"wo": "."
	"wp": ")"

	"eq": "x"
	"ew": "d"
	"er": "r"
	"eu": "y"
	"ei": ","
	"eo": "-"
	"ep": "'"

	"rq": "f"
	"rw": "c"
	"re": "r"
	"ru": "b"
	"ri": "v"
	"ro": "g"
	"rp": "\\"
	"r ": "t "

	"uq": "q"
	"uw": "j"
	"ue": "y"
	"ur": "b"
	"ui": "h"
	"uo": "u"
	"up": "m"
	"u ": "n "

	"iq": "!"
	"iw": "z"
	"ie": ","
	"ir": "v"
	"iu": "h"
	"io": "l"
	"ip": "k"
	"i ": "i "

	"oq": "("
	"ow": "."
	"oe": "-"
	"or": "g"
	"ou": "u"
	"oi": "l"
	"op": ";"
	"o ": "o "

	"pq": "("
	"pw": "z"
	"pe": "'"
	"pr": "/"
	"pu": "m"
	"pi": "k"
	"po": ";"
	"p ": "p "

	"qwe": "we"
	"qpo": "->"
	"qop": "->"
	"qip": "=>"
	"qpi": "=>"
	"eru": "y"
	"eri": "ri"
	"erui": "the"
	"eriu": "the"
}

nameOf = (symbol) ->
	keyCodes[symbol].replace /KeyCode::/g, ""

$ = require "bling"

modes = $.keysOf(mappings).sortBy('length').reverse().filterMap((s) ->
	if s.length > 1
		s.substr(0,s.length-1)
	else null
).distinct()
# TODO: fill out missing intermediate modes as needed

output = ""

tab = (n) -> "\n" + $.repeat "\t", n

for mode in modes
	output += "#{tab 4}<modifierdef>#{mode.toUpperCase()}_MODE</modifierdef>"

for mode in modes
	output += """#{tab 4}<block>#{tab 5}<modifier_only>ModifierFlag::#{mode.toUpperCase()}_MODE</modifier_only>
	"""
	re = RegExp "^" + mode
	for combo in $.keysOf(mappings).filter(re).replace(re,'').filter('',false) when combo of keyCodes
		key = mode + combo
		mapping = mappings[key].split('').map((s) -> keyCodes[s]).join ', '

		if key in modes
			output += "#{tab 5}<autogen>__KeyOverlaidModifier__ #{keyCodes[combo]}, KeyCode::VK_MODIFIER_#{key.toUpperCase()}_MODE, #{mapping} </autogen>"
		else
			output += "#{tab 5}<autogen>__KeyToKey__ #{keyCodes[combo]}, #{mapping} </autogen>"

	output += "#{tab 4}</block>"

for single in $.keysOf(mappings).filter(/^.$/)
	upper = single.toUpperCase()
	if single in modes
		output += "#{tab 4}<autogen>__KeyOverlaidModifier__ #{keyCodes[single]}, KeyCode::VK_MODIFIER_#{upper}_MODE, #{keyCodes[mappings[single]]}</autogen>"
	else
		output += "#{tab 4}<autogen>__KeyToKey__ #{keyCodes[single]}, #{keyCodes[mappings[single]]}</autogen>"

fs = require 'fs'
console.log String fs.readFileSync "header"
console.log output
console.log String fs.readFileSync "footer"

