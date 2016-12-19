;FLAVOR:RepRap
M106 S130 ;turn the fan on
;M851 Z-1.1
M851 Z-0.9
M500
G28 Z ; Home Z
M23 dagoma.g
M24 ;print file
