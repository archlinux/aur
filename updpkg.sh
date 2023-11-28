#!/bin/bash

_pkgver=7.6.1.2
pkgver=7.6.1.2

sed -i "6s|_pkgver=.*|_pkgver=${_pkgver}|" PKGBUILD

sed -i "7s|pkgver=.*|pkgver=${pkgver}|" PKGBUILD

makepkg --printsrcinfo > .SRCINFO

sed -i '/source/d' .SRCINFO

sed -i '/sha256sums/d' .SRCINFO

sed -i '/pkgname/d' .SRCINFO

sed -i '/^$/d' .SRCINFO

cat >> .SRCINFO <<-EOF

pkgname = libreoffice-dev-af
    pkgdesc="Afrikaans language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_af.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-am
    pkgdesc="Amharic language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_am.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_am.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-ar
    pkgdesc="Arabic language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ar.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_ar.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-as
    pkgdesc="Assamese (India) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_as.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-ast
    pkgdesc="Asturianu language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ast.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_ast.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-be
    pkgdesc="Belarusian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_be.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-bg
    pkgdesc="Bulgarian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_bg.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_bg.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-bn-in
    pkgdesc="Bengali (India) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_bn-in.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_bn-in.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-bn
    pkgdesc="Bengali language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_bn.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_bn.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-bo
    pkgdesc="Tibetan language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_bo.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_bo.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-br
    pkgdesc="Breton language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_br.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-brx
    pkgdesc="Bodo language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_brx.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-bs
    pkgdesc="Bosnian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_bs.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_bs.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-ca-valencia
    pkgdesc="Catalan (Valencia) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ca-valencia.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_ca-valencia.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-ca
    pkgdesc="Catalan language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ca.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_ca.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-cs
    pkgdesc="Czech language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_cs.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_cs.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-cy
    pkgdesc="Welsh language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_cy.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-da
    pkgdesc="Danish language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_da.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_da.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-de
    pkgdesc="German language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_de.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_de.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-dgo
    pkgdesc="Dogri language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_dgo.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-dsb
    pkgdesc="Lower Sorbian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_dsb.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_dsb.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-dz
    pkgdesc="Dzongkha language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_dz.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_dz.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-el
    pkgdesc="Greek language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_el.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_el.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-en-gb
    pkgdesc="English (GB) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_en-gb.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_en-gb.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-en-za
    pkgdesc="English (ZA) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_en-za.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_en-za.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-eo
    pkgdesc="Esperanto language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_eo.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_eo.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-es
    pkgdesc="Spanish language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_es.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_es.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-et
    pkgdesc="Estonian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_et.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_et.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-eu
    pkgdesc="Basque language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_eu.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_eu.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-fa
    pkgdesc="Persian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_fa.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-fi
    pkgdesc="Finnish language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_fi.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_fi.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-fr
    pkgdesc="French language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_fr.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_fr.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-fur
    pkgdesc="Friulian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_fur.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-fy
    pkgdesc="Western Frisian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_fy.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-ga
    pkgdesc="Irish language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ga.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-gd
    pkgdesc="Gaelic (Scottish) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_gd.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-gl
    pkgdesc="Galician language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_gl.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_gl.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-gu
    pkgdesc="Gujarati language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_gu.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_gu.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-gug
    pkgdesc="Paraguayan Guaraní language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_gug.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-he
    pkgdesc="Hebrew language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_he.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_he.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-hi
    pkgdesc="Hindi language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_hi.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_hi.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-hr
    pkgdesc="Croatian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_hr.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_hr.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-hsb
    pkgdesc="Upper Sorbian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_hsb.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_hsb.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-hu
    pkgdesc="Hungarian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_hu.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_hu.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-id
    pkgdesc="Indonesian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_id.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_id.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-is
    pkgdesc="Icelandic language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_is.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_is.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-it
    pkgdesc="Italian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_it.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_it.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-ja
    pkgdesc="Japanese language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ja.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_ja.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-ka
    pkgdesc="Georgian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ka.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_ka.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-kab
    pkgdesc="Kabyle language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_kab.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-kk
    pkgdesc="Kazakh language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_kk.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-km
    pkgdesc="Khmer (Cambodia) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_km.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_km.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-kmr-latn
    pkgdesc="Kurdish language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_kmr-latn.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-kn
    pkgdesc="Kannada language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_kn.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-ko
    pkgdesc="Korean language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ko.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_ko.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-kok
    pkgdesc="Konkani language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_kok.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-ks
    pkgdesc="Kashmiri language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ks.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-lb
    pkgdesc="Luxembourgish language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_lb.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-lo
    pkgdesc="Lao language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_lo.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_lo.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-lt
    pkgdesc="Lithuanian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_lt.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_lt.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-lv
    pkgdesc="Latvian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_lv.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_lv.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-mai
    pkgdesc="Maithili language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_mai.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-mk
    pkgdesc="Macedonian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_mk.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_mk.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-ml
    pkgdesc="Malayalam language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ml.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-mn
    pkgdesc="Mongolian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_mn.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-mni
    pkgdesc="Manipuri language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_mni.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-mr
    pkgdesc="Marathi language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_mr.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-my
    pkgdesc="Burmese language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_my.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-nb
    pkgdesc="Norwegian Bokmal language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_nb.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_nb.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-ne
    pkgdesc="Nepali language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ne.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_ne.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-nl
    pkgdesc="Dutch language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_nl.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_nl.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-nn
    pkgdesc="Norwegian Nynorsk language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_nn.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_nn.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-nr
    pkgdesc="Ndebele (South) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_nr.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-nso
    pkgdesc="Northern Sotho language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_nso.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-oc
    pkgdesc="Occitan language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_oc.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-om
    pkgdesc="Oromo language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_om.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_om.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-or
    pkgdesc="Oriya language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_or.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-pa-in
    pkgdesc="Punjabi (India) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_pa-in.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-pl
    pkgdesc="Polish language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_pl.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_pl.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-pt-br
    pkgdesc="Portuguese (Brazil) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_pt-br.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_pt-br.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-pt
    pkgdesc="Portuguese language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_pt.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_pt.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-ro
    pkgdesc="Romanian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ro.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_ro.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-ru
    pkgdesc="Russian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ru.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_ru.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-rw
    pkgdesc="Kinyarwanda language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_rw.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-qtz
    pkgdesc="Weblate Localization language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_qtz.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-sa-in
    pkgdesc="Sanskrit (India) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_sa-in.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-sat
    pkgdesc="Santali language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_sat.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-sd
    pkgdesc="Sindhi language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_sd.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-si
    pkgdesc="Singhalese language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_si.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_si.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-sid
    pkgdesc="Sidama language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_sid.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_sid.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-sk
    pkgdesc="Slovak language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_sk.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_sk.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-sl
    pkgdesc="Slovenian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_sl.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_sl.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-sq
    pkgdesc="Albanien language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_sq.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_sq.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-sr-latn
    pkgdesc="Serbian (Latin) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_sr-latn.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-sr
    pkgdesc="Serbian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_sr.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-ss
    pkgdesc="Swati language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ss.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-st
    pkgdesc="Southern Sotho language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_st.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-sv
    pkgdesc="Swedish language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_sv.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_sv.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-sw-tz
    pkgdesc="Swahili (Tanzania) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_sw-tz.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-szl
    pkgdesc="Silesian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_szl.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-ta
    pkgdesc="Tamil language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ta.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_ta.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-te
    pkgdesc="Telugu language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_te.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-tg
    pkgdesc="Tajik language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_tg.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_tg.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-th
    pkgdesc="Thai language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_th.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-tn
    pkgdesc="Tswana language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_tn.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-tr
    pkgdesc="Turkish language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_tr.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_tr.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-ts
    pkgdesc="Tsonga language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ts.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-tt
    pkgdesc="Tatar language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_tt.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-ug
    pkgdesc="Uighur language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ug.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_ug.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-uk
    pkgdesc="Ukrainian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_uk.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_uk.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-uz
    pkgdesc="Uzbek language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_uz.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-ve
    pkgdesc="Venda language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_ve.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-vec
    pkgdesc="Venetian language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_vec.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-vi
    pkgdesc="Vietnamese language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_vi.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_vi.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-xh
    pkgdesc="Xhosa language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_xh.tar.gz
    sha256sums = SKIP

pkgname = libreoffice-dev-zh-cn
    pkgdesc="Chinese (simplified) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_zh-cn.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_zh-cn.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-zh-tw
    pkgdesc="Chinese (traditional) language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_zh-tw.tar.gz
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_helppack_zh-tw.tar.gz
    sha256sums = SKIP
    sha256sums = SKIP

pkgname = libreoffice-dev-zu
    pkgdesc="Zulu language pack for LibreOffice Dev"
    source = https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/LibreOffice_${pkgver}_Linux_x86-64_rpm_langpack_zu.tar.gz
    sha256sums = SKIP
EOF
