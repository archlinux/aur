#!/bin/sh
#
# Copyright (C) 2002 Daniel Veillard.  All Rights Reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is fur-
# nished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FIT-
# NESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
# DANIEL VEILLARD BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON-
# NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# Except as contained in this notice, the name of Daniel Veillard shall not
# be used in advertising or otherwise to promote the sale, use or other deal-
# ings in this Software without prior written authorization from him.
#
# Copyright (C) 2002 Eric Baudais.  All Rights Reserved.
#
# Modifications made to Daniel Veillard's catalog build script at 
# http://xmlsoft.org/buildDocBookCatalog.

if [ ! -d /etc/xml -a -w /etc ]
then
    echo Directory /etc/xml missing unable to delete catalog
	exit 1
fi
if [ -w /etc/xml/catalog -a -w /etc/xml ]
then
    ROOTCATALOG=/etc/xml/catalog
elif [ -w $HOME/xmlcatalog -a -w $HOME ]
then
	ROOTCATALOG=$HOME/xmlcatalog
else
    echo Unable to update root catalog
	exit 1
fi
if [ -w /etc/xml/docbook -a -w /etc/xml ]
then
	CATALOG=/etc/xml/docbook
elif [ -w $HOME/dbkxmlcatalog -a -w $HOME ]
then
	CATALOG=/$HOME/dbkxmlcatalog
else
	echo Unable to update docbook catalog
	exit 1
fi

echo Found root catalog in $ROOTCATALOG
echo Found docbook catalog in $CATALOG
docbookdir=$1
echo Found DocBook DTD in $docbookdir

xmlcatalog --noout --del \
    "file://$docbookdir/dbpoolx.mod" $CATALOG
xmlcatalog --noout --del \
    "file://$docbookdir/docbookx.dtd" $CATALOG
xmlcatalog --noout --del \
    "file://$docbookdir/dbcentx.mod" $CATALOG
xmlcatalog --noout --del \
    "file://$docbookdir/dbnotnx.mod" $CATALOG
xmlcatalog --noout --del \
    "file://$docbookdir/dbgenent.mod" $CATALOG
xmlcatalog --noout --del \
    "file://$docbookdir/dbhierx.mod" $CATALOG
xmlcatalog --noout --del \
    "file://$docbookdir/soextblx.dtd" $CATALOG
xmlcatalog --noout --del \
    "file://$docbookdir/calstblx.dtd" $CATALOG
xmlcatalog --noout --del \
    "http://www.oasis-open.org/docbook/xml/4.1.2" \
    $CATALOG
xmlcatalog --noout --del \
    "http://www.oasis-open.org/docbook/xml/4.1.2" \
    $CATALOG

xmlcatalog --noout --del \
    "-//OASIS//ENTITIES DocBook XML" \
    $ROOTCATALOG
xmlcatalog --noout --del \
	"-//OASIS//DTD DocBook XML" \
    $ROOTCATALOG
xmlcatalog --noout --del \
    "http://www.oasis-open.org/docbook/" \
    $ROOTCATALOG
xmlcatalog --noout --del \
    "http://www.oasis-open.org/docbook/" \
    $ROOTCATALOG

isodir=$1/ent
echo Found ISO DocBook entities in $isodir

xmlcatalog --noout --del \
    "file://$isodir/iso-pub.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-grk1.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-box.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-grk3.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-amsn.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-num.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-grk4.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-dia.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-grk2.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-amsa.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-amso.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-cyr1.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-tech.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-amsc.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-lat1.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-amsb.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-lat2.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-amsr.ent" $CATALOG
xmlcatalog --noout --del \
    "file://$isodir/iso-cyr2.ent" $CATALOG

xmlcatalog --noout --del \
    "ISO 8879:1986" $ROOTCATALOG
#
#
