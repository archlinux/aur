#!/usr/bin/env -S sed -nEf

/^GNU Free Documentation License$/ {
	:a
	p
	n

	# Stop on next entry.
	/^\S/ q

	# Continue printing GFDL.
	b a
}
