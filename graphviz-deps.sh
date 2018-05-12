#!/bin/bash

{
	printf 'digraph deps {\noverlap=scale;\n'
	sed -r '
		s/\([^()]*\)//g
		s/(collaboraofficebasis5.3)-[a-z]{2,3}(-[a-z]+)*-(calc|res|writer)/\1-LANG-\3/g
		s/(collaboraoffice5.3-dict|collaboraofficebasis5.3)-[a-z]{2,3}(-[a-z]+)*($|[^-a-z])/\1-LANG\3/g
	' Packages \
	| tr -d ' ' | tr '.+-' _ \
	| gawk -F: '
		function pr() {
			if (p ~ /_dev$/ || p ~ /_dbgsym/) return
			split(d, a, ",")
			for (i in a) if (a[i] != "") printf("%s -> %s;\n", p, a[i])
			p=""
			d=""
		}
		/^Package/ { p=$2 }
		/^Depends/ { d=$2 }
		/^$/ { pr() }
		END  { pr() }
	' | sort -u
	echo '}'
} >deps.dot
dot -Tpdf deps.dot >dot.pdf
twopi -Tpdf deps.dot >twopi.pdf
circo -Tpdf deps.dot >circo.pdf
