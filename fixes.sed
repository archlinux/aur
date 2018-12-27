#!/usr/bin/env -S sed -Ef

# A large part of the changes is derived from a diff between 0.48 and
# Debian's 0.48.5, excluding changes included in the new gcide release and
# those that do not change the final output.
#
# Sources:
# http://archive.debian.org/debian-archive/debian/pool/main/d/dict-gcide/dict-gcide_0.48.orig.tar.gz
# http://deb.debian.org/debian/pool/main/d/dict-gcide/dict-gcide_0.48.5.tar.xz

# TODO:
# * '[<source></source>]'
# * '</item><item>' (dict -d gcide legislation)


## GENERAL

# Remove lines pretending to be in a particular font.
\`^<p>\s*(<note>\s*)?<hand/\s*(<[^>]*type>\s*)?This\s*line\s*is\s*printed\s*in`, \`^\s*$` d

# Remove book and publ tags in a qau element.
# <publ> seems to be removed by webfmt, so apparently not necessary to
# remove here.
s`(<qau>[^<]*)(<book>|<publ>)([^<]*)(</book>|</publ>)`\1\3`g


## CIDE.A

# Typo.
s`^(<p><q><qex>A priori</qex>, that is,) form (these necessities)`\1 from \2`

# Add some semicolon.
\`^<mhw>\{ <hw>Ar"que\*bus</hw>, <hw>Ar"que\*buse</hw>  \}</mhw>` {
	s`(<def>A sort of hand gun or firearm) (a contrivance)`\1\; \2`
}


## CIDE.B

# Add a closing paranthis.
s`\(Thirteenth Greatest of Centuries, 1913\.`&)`


## CIDE.C

# Remove empty element.
s`<stype></stype>``


## CIDE.D

# Descartes did not live one and a half millennia.
\`^<hw>Descartes</hw>` {
	s`(born) 159, (died)`\1 1596, \2`
}

# Typo; doubled quote.
\`^<p><syn><b>Syn\.</b> -- To vary\; disagree\; dissent\; dispute\;` {
	s`(<xex>)aiffer (with</xex>)`\1differ \2`
	s`(<rdquo/){2}`\1`
}

# Remove empty element.
\`^<p><ent>diploid</ent>`, \`<ent>` {
	s`^(B: Oh, how I wish.*</q>)\s*<rj><qau></qau></rj>(</p>)`\1\2`
}

# In 0.48, the 'between' was missing;  I prefer Debian's way of solving it.
\`^<p><ent>Doublet</ent>`, \`<ent>` {
	\`^<p><sn>4\.</sn>` {
		s`(with a) (color between them)`\1 layer of \2`
	}
}


## CIDE.E

# Restrict qau element to the author themself.
s`^(<qau>Mark Feeney)(<br/)`\1</qau>\2`
\`^Copyright 1999 Globe Newspaper Company\.` {
	s`</qau>``
}


## CIDE.F

s`measurments`measurements`

# Fix misattribution.
s`(Dostoevsky's) (War and Peace)`\1 Crime and Punishment\; or Tolstoy's \2`

s`compIy`comply`


## CIDE.I

# Remove qau tags.
\`^<rj><qau>Dr\. Rod Beavon<br/`, +2 {
	s`^(<rj>)<qau>(Dr\. Rod Beavon<br/)`\1\2</rj>`
	s`^\((17 Dean's Yard London SW1P 3PB)\;(<br/)`<rj>\1</rj>\2`
	s`(e-mail:  rod\.beavon@westminster\.org\.uk)</qau>(</rj><br/)`<rj>\1\2`
}


## M

# Remove extraneous ', in'.
s`^(<qau>Andrew Hood), in`\1`


## P

# Restrict col element's content.
\`^<p><cs><col><b>Park of artillery</b></col>` {
	s`(<col><b>industrial park</b>) `\1</col>`
	s`</col>(</cs><br/)$`\1`
}


## R

# Typo.
\`^<hw>Re\*cu"sant</hw>` {
	s`\bchurc\b`church`
}

# Remove text centering around a referenced image.
# Debian removed the preceding paragraph as well.  I do not agree.
\`<a href="\\cide\\more\\lilac-breasted-roller\.jpg">`, \`zambezi\.co\.uk` d


## S

# Fix badly formatted closing tag (<i>(.*)</> -> <i>\1</i>).
s`<([^><]*)>([^<]*)</>`<\1>\2</\1>`

# If one wanted to fix more than necessary (Debian does):
#\`^<hw>Ses\*quip"li\*cate</hw>` {
#	s`^`<p>`
#	s`<(/?)i>`<\1xex>`g
#
#	s`(<xex>)(a|b)(</xex>)<prime/`\1\2\\'\''b7\3`g
#	s`<prime/`\\'\''b7`
#}

s`\<(something)l\>`\1`

s`rappng`rapping`


## T

# Restrict qau to the author themself.
\`^<rj><qau>Andrew Forbes/CPA`, +1 {
	s`^<rj><qau>Andrew Forbes/CPA`&</qau>`
	s`^(\(from.*)</qau>(</rj><br/)$`\1\2`
}


## U

# Restrict au element to the author themself.
\`^<au>Kari Jensen \(University of Wisconsin`, +1 {
	s`^<au>Kari Jensen`&</au>`
	s`^(\[available at.*)</au>(<br/)$`\1\2`
}


## V

# Avoid double empty line in dict's output.
\`^<p><cs><col><b>Principle of virtual velocities</b>` {
	s`-(- <col><b>Virtual image</b></col>)`\1`
}


## W
s`\<(Where\*?)form\>`\1from`
