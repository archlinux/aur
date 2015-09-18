#!/bin/bash
# $Header: /var/cvsroot/gentoo-src/build-docbook-catalog/build-docbook-catalog,v 1.2 2004/07/22 22:35:18 agriffis Exp $
#
# build-docbook-catalog: populate /etc/xml/docbook based in
# installed docbook-xml-dtd versions.
#
# Copyright 2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# written by Aron Griffis
#

ROOTCATALOG=/etc/xml/catalog
CATALOG=/etc/xml/docbook
DOCBOOKDIR=/usr/share/sgml/docbook
DTDS=/usr/share/sgml/docbook/xml-dtd-4.4
LATEST_DTD=/usr/share/sgml/docbook/xml-dtd-4.4
LATEST_DATE=
xsldir=/usr/share/xml/docbook/html
VERBOSE=false
ZERO=${0##*/}

#
# main (called from bottom)
#
main() {
	typeset d v opts

	opts=$(getopt -o v --long verbose -n "$ZERO" -- "$@") || exit 1
	eval set -- "$opts"
	while true; do
		case "$1" in
			-v|--verbose) VERBOSE=true ; shift ;;
			--) shift ; break ;;
			*) echo "Options parsing failed on $1!" >&2 ; exit 1 ;;
		esac
	done

	create_catalogs			# will exit on error
	populate_xsl

	# Clean out old dtds from catalog
	verb "Cleaning out old DocBook XML versions from ${CATALOG} and ${ROOTCATALOG}"
	clean_catalog "${DOCBOOKDIR}/xml-dtd-[^/\"']*/[^/\"']*" ${CATALOG}
	clean_catalog "${DOCBOOKDIR}/xml-dtd-[^/\"']*/[^/\"']*" ${ROOTCATALOG}

	if set_dtds; then
		for d in ${DTDS}; do
			populate_dtd ${d}
		done
		populate_entities
	fi

	exit 0
}

# 
# verbose echo -- only echo if called with --verbose
#
verb() {
	$VERBOSE && echo "$*"
}

#
# fill in the DTDS variable based on installed versions
# 
set_dtds() {
	DTDS=$(find ${DOCBOOKDIR} -path '*/xml-dtd-*/docbookx.dtd')
	if [[ -z ${DTDS} ]]; then
		echo "No installed DocBook XML DTDs found"
		return 1
	else
		return 0
	fi
}

#
# create the catalogs root and docbook specific
#
create_catalogs() {
	if [[ ! -r ${ROOTCATALOG} ]] ; then
		echo "Creating XML Catalog root ${ROOTCATALOG}"
		/usr/bin/xmlcatalog --noout --create ${ROOTCATALOG}
		if [[ ! -r ${ROOTCATALOG} ]] ; then
			echo "Failed creating ${ROOTCATALOG}, aborting" >&2
			exit 1
		fi
	else
		verb "Found XML Catalog root ${ROOTCATALOG}"
		# clean out existing entries
		verb "  Cleaning existing ${CATALOG} delegates from ${ROOTCATALOG}"
		clean_catalog "file://${CATALOG}" ${ROOTCATALOG}
	fi

	if [[ ! -r ${CATALOG} ]] ; then
		echo "Creating DocBook XML Catalog ${CATALOG}"
		/usr/bin/xmlcatalog --noout --create ${CATALOG}
		if [[ ! -r ${CATALOG} ]] ; then
			echo "Failed creating ${CATALOG}, aborting" >&2
			exit 1
		fi
	else
		verb "Found DocBook XML Catalog ${CATALOG}"
	fi

	# dtd pointers
	verb "  Populating ${ROOTCATALOG} with DTD delegates to ${CATALOG}"
	xmlcatalog --noout --add "delegatePublic" "-//OASIS//ENTITIES DocBook XML" "file://${CATALOG}" ${ROOTCATALOG}
	xmlcatalog --noout --add "delegatePublic" "-//OASIS//DTD DocBook XML" "file://${CATALOG}" ${ROOTCATALOG}
	xmlcatalog --noout --add "delegateSystem" "http://www.oasis-open.org/docbook/" "file://${CATALOG}" ${ROOTCATALOG}
	xmlcatalog --noout --add "delegateURI" "http://www.oasis-open.org/docbook/" "file://${CATALOG}" ${ROOTCATALOG}
	xmlcatalog --noout --add "delegateSystem" "http://docbook.sourceforge.net/release/xsl/" "file://${CATALOG}" ${ROOTCATALOG}
	xmlcatalog --noout --add "delegateURI" "http://docbook.sourceforge.net/release/xsl/" "file://${CATALOG}" ${ROOTCATALOG}

	# entities pointer
	verb "  Populating ${ROOTCATALOG} with ISO entities delegate to ${CATALOG}"
	xmlcatalog --noout --add "delegatePublic" "ISO 8879:1986" "file://${CATALOG}" ${ROOTCATALOG}
}

#
# clean_catalog
# $1 == regex to clean
# $2 == catalog
#
clean_catalog() {
	typeset list f regex=$1 catalog=$2

	list=$(egrep --only-matching "${regex}" "${catalog}" | sort -u)
	for f in ${list}; do
		xmlcatalog --noout --del "${f}" ${catalog}
	done
}

# 
# populate a specific dtd version into the docbook catalog
# $1 == /path/to/docbookx.dtd
#
populate_dtd() {
	typeset dtd=$1 docbookdir=${1%/*} dtd_date
	typeset v=${docbookdir##*-}

	# sanity check
	if [[ ${dtd} != */xml-dtd-*/* ]]; then
		echo "Warning: I don't understand \"${dtd}\"" >&2
		return
	fi
	echo "Found DocBook XML ${v} in ${docbookdir}"

	# Populate the docbook catalog with this version
	verb "  Populating ${CATALOG} based on ${docbookdir}"
	xmlcatalog --noout --add "public" "-//OASIS//ELEMENTS DocBook XML Information Pool V${v}//EN" "file://${docbookdir}/dbpoolx.mod" ${CATALOG}
	xmlcatalog --noout --add "public" "-//OASIS//DTD DocBook XML V${v}//EN" "file://${docbookdir}/docbookx.dtd" ${CATALOG}
	xmlcatalog --noout --add "public" "-//OASIS//ENTITIES DocBook XML Character Entities V${v}//EN" "file://${docbookdir}/dbcentx.mod" ${CATALOG}
	xmlcatalog --noout --add "public" "-//OASIS//ENTITIES DocBook XML Notations V${v}//EN" "file://${docbookdir}/dbnotnx.mod" ${CATALOG}
	xmlcatalog --noout --add "public" "-//OASIS//ENTITIES DocBook XML Additional General Entities V${v}//EN" "file://${docbookdir}/dbgenent.mod" ${CATALOG}
	xmlcatalog --noout --add "public" "-//OASIS//ELEMENTS DocBook XML Document Hierarchy V${v}//EN" "file://${docbookdir}/dbhierx.mod" ${CATALOG}
	xmlcatalog --noout --add "public" "-//OASIS//DTD XML Exchange Table Model 19990315//EN" "file://${docbookdir}/soextblx.dtd" ${CATALOG}
	xmlcatalog --noout --add "public" "-//OASIS//DTD DocBook XML CALS Table Model V${v}//EN" "file://${docbookdir}/calstblx.dtd" ${CATALOG}
	xmlcatalog --noout --add "rewriteSystem" "http://www.oasis-open.org/docbook/xml/${v}" "file://${docbookdir}" ${CATALOG}
	xmlcatalog --noout --add "rewriteURI" "http://www.oasis-open.org/docbook/xml/${v}" "file://${docbookdir}" ${CATALOG}

	# grab the RCS date from docbookx.dtd for comparison purposes
	if [[ ! -f ${docbookdir}/ent/iso-lat1.ent ]]; then
		verb "  No entities available for ${dtd}"
		return 0
	fi
	dtd_date=$(egrep --only-matching --max-count=1 \
		'[0-9]{4}/[0-9]{2}/[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}' "${dtd}")
	if [[ -z ${dtd_date} ]]; then
		verb "  Couldn't find RCS date in ${dtd}, ignoring entities"
		return 0
	fi
	verb "  RCS datestamp in ${dtd} is ${dtd_date}"
	dtd_date=$(date -d "$dtd_date" +%s)
	if [[ -z $LATEST_DTD || $dtd_date -gt $LATEST_DATE ]]; then
		LATEST_DATE=${dtd_date}
		LATEST_DTD=${dtd}
	fi
}

#
# populate ISO DocBook entities from the most recent DTD
#
populate_entities() {
	typeset isodir=/usr/share/sgml/docbook/xml-dtd-4.4/ent
	typeset -a entities avail

	# sanity check
	if [[ -z ${LATEST_DTD} || ! -d ${isodir} ]]; then
		echo "No ISO DocBook entities available for catalog"
		return 0
	fi
	echo "Using ISO DocBook entities from ${isodir}"

	# here are the entities we know about;
	# note these must remain sorted!
	entities=(
		"iso-amsa.ent" "ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN"
		"iso-amsb.ent" "ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN"
		"iso-amsc.ent" "ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN"
		"iso-amsn.ent" "ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN"
		"iso-amso.ent" "ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN"
		"iso-amsr.ent" "ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN"
		"iso-box.ent" "ISO 8879:1986//ENTITIES Box and Line Drawing//EN"
		"iso-cyr1.ent" "ISO 8879:1986//ENTITIES Russian Cyrillic//EN"
		"iso-cyr2.ent" "ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN"
		"iso-dia.ent" "ISO 8879:1986//ENTITIES Diacritical Marks//EN"
		"iso-grk1.ent" "ISO 8879:1986//ENTITIES Greek Letters//EN"
		"iso-grk2.ent" "ISO 8879:1986//ENTITIES Monotoniko Greek//EN"
		"iso-grk3.ent" "ISO 8879:1986//ENTITIES Greek Symbols//EN"
		"iso-grk4.ent" "ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN"
		"iso-lat1.ent" "ISO 8879:1986//ENTITIES Added Latin 1//EN"
		"iso-lat2.ent" "ISO 8879:1986//ENTITIES Added Latin 2//EN"
		"iso-num.ent" "ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN"
		"iso-pub.ent" "ISO 8879:1986//ENTITIES Publishing//EN"
		"iso-tech.ent" "ISO 8879:1986//ENTITIES General Technical//EN"
	)

	# here are the entities available; assume no spaces in filenames...
	avail=($(ls ${isodir} | sort))

	# double-check the lists
	verb "  Populating ${CATALOG} with ISO DocBook entities"
	i=0 ; j=0
	while [[ ${i} -lt ${#entities[@]} || ${j} -lt ${#avail[@]} ]]; do
		if [[ ${i} -ge ${#entities[@]} ]]; then
			echo "Warning: Extra ISO entities file: ${avail[j]}"
			let j=j+1
		elif [[ ${j} -ge ${#avail[@]} ]]; then
			echo "Warning: Entities file not found: ${entities[i]}"
			let i=i+2
		elif [[ ${avail[j]} < ${entities[i]} ]]; then
			echo "Warning: Extra ISO entities file: ${avail[j]}"
			let j=j+1
		elif [[ ${entities[i]} < ${avail[j]} ]]; then
			echo "Warning: Entities file not found: ${entities[i]}"
			let i=i+2
		elif [[ ${entities[i]} == ${avail[j]} ]]; then
			xmlcatalog --noout --add "public" "${entities[i+1]}" \
				"file://${isodir}/${entities[i]}" ${CATALOG}
			let j=j+1
			let i=i+2
		else
			echo "${0}: Whoah, shouldn't be here, aborting" >&2
			exit 1
		fi
	done
}

#
# populate XSL stylesheets
#
populate_xsl() {
	typeset listed avail f

	# Delete current entries from the catalog
	clean_catalog "${DOCBOOKDIR}/xsl-stylesheets-[0-9\.]+" $CATALOG
	clean_catalog "${DOCBOOKDIR}/xsl-stylesheets-[0-9\.]+" $ROOTCATALOG

	# Find the available XSL stylesheets.  In theory there should only
	# be one match since these aren't slotted, but restrict to the
	# first match anyway...
	

	if [[ ! -e ${xsldir}/html/docbook.xsl || ! -e ${xsldir}/common/l10n.xml ]]; then
		echo "DocBook XSLT stylesheets are missing files from ${xsldir}" >&2
		return 1
	fi

	# Populate catalog with XSL entries
	echo "Found DocBook XSL stylesheets in ${xsldir}"
	verb "  Populating ${CATALOG} with XSL stylesheets"
	for version in current 1.39 1.40 1.41 1.42 1.43 1.44 1.45 1.46 1.47 \
		1.48 1.49 1.50 ${xsldir##*-}
	do
		xmlcatalog --noout --add "rewriteSystem" "http://docbook.sourceforge.net/release/xsl/${version}" "file://${xsldir}" ${CATALOG}
		xmlcatalog --noout --add "rewriteURI" "http://docbook.sourceforge.net/release/xsl/${version}" "file://${xsldir}" ${CATALOG}
	done
}

# Call the main routine
main "$@"
