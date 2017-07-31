s`(<altname>|<contr>)<cref>([^<]*)</cref>`\1\2`g
s`(<stype>|<prod>)<ecol>([^<]*)</ecol>`\1\2`g

s`<col>([^<]*),? <cd>([^<]*)</col>`<col>\1</col>, <cd>\2`g

s`(<qau>[^<]*)(<book>|<publ>)([^<]*)(</book>|</publ>)`\1\3`g

s`<qau>([^<]*)(<break>)`<qau>\1</qau>\2`
s`^([^<]*)</qau>`\1`
s`<qau>([^<]*) (\([^)]{20}[^<]*)</qau>`<qau>\1</qau> \2`

s`<au>([^<]*)<break>`<au>\1</au><break>`
s`^([^<]*)</au>`\1`

s`,? <[^>]*></[^>]*> ?``g
s`</>``g

s`(<qau>Andrew Hood), in`\1`
s`\(Thirteenth Greatest of Centuries, 1913.`&)`
/<a href="\\cide\\more\\lilac-breasted-roller.jpg">/,/zambezi.co.uk/d
