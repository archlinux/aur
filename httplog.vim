" Vim syntax file
" FileType:     Access log of Apache, nginx, etc
" Author:       lilydjwg <lilydjwg@gmail.com>
" Contributor:	Audrius Kažukauskas
" Version:	0.5
" ---------------------------------------------------------------------

syntax clear
syntax case match

syn match httplogIP	/\v^[[:xdigit:].:]+/ contains=httplogLocal,httplogLAN
syn match httplogTime	/\v\s\zs\[[^]]+\]\ze\s/
syn match httplogPage	/\v\s\zs"(GET|POST|HEAD|PUT|DELETE|CONNECT|OPTIONS|PATCH|TRACE) [^"]+"\ze\s/
syn match httplogResult	/\v\s\zs[1-4]\d{2}\ze\s%(\d+|-)/
syn match httplogError	/\v\s\zs5\d{2}\ze\s%(\d+|-)/
syn match httplogRef	/\v\s\zs"(http[^"]+|-)"\ze\s/
syn match httplogUA	/\v\s\zs"[^"]+"$/ contains=httplogBrowser
syn match httplogBrowser	/\<UCWEB\d\@=/
syn match httplogBrowser	/\v(".*Chrome.*)@<!<Safari>/
syn match httplogBrowser	/\v(".*%(Chrom|Google Web Preview).*)@<!<Chrome>(.*Chrome.*")@!/
syn match httplogBrowser	/\<Feedfetcher-Google\>/
syn match httplogBrowser	/\<Google Web Preview\>/
syn match httplogBrowser	"\<bingbot\>/\@="
syn match httplogBrowser	/\<Sogou web spider\>/
syn keyword httplogBrowser	Firefox MSIE Konqueror Chromium ChromePlus Opera w3m Wget aria2 Lynx Epiphany Links TheWorld contained
syn keyword httplogBrowser	gvfs curl pacman PackageKit contained
syn keyword httplogBrowser	Googlebot Baiduspider Sosospider YandexBot W3C_Validator Jigsaw PhantomJS ia_archiver contained
syn match httplogLAN	/\v^192\.168\.\d+\.\d+/ contained
syn match httplogLAN	/\v^172\.(1[6-9]|2[0-9]|3[01])\.\d+\.\d+/ contained
syn match httplogLAN	/\v^10\.\d+\.\d+\.\d+/ contained
syn match httplogLocal	/^::1|^127\.0\.0\.1\>/ contained

hi link httplogIP	Identifier
hi link httplogTime	Constant
hi link httplogPage	Underlined
hi link httplogResult	Number
hi link httplogError	ErrorMsg
hi link httplogRef	Statement
hi link httplogUA	Type
hi link httplogBrowser	String
hi link httplogLocal	Special
hi link httplogLAN	PreProc

let b:current_syntax = "httplog"
