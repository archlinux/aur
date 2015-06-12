# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds
pkgname=miscfiles
pkgver=1.5
pkgrel=1
pkgdesc="The GNU Miscfiles collection. Includes the Webster's Second International English wordlist and appendix English wordlist."
arch=(any)
url="http://www.gnu.org/software/miscfiles/"
license=(GPL)
depends=(util-linux)
install=${pkgname}.install

source=(
  ftp://gnu.mirrorcatalogs.com/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz
)

md5sums=(
  d80bc60eb1eef394da46c794e5236f07
)

package () {

  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d ${pkgdir}/usr/share/dict
  install -d ${pkgdir}/usr/share/miscfiles

  install -m0644 ${srcdir}/${pkgname}-${pkgver}/abbrevs.gen ${pkgdir}/usr/share/miscfiles/abbrevs.gen
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/abbrevs.talk ${pkgdir}/usr/share/miscfiles/abbrevs.talk
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/airport ${pkgdir}/usr/share/miscfiles/airport
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/ascii ${pkgdir}/usr/share/miscfiles/ascii
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/bcp-index.txt ${pkgdir}/usr/share/miscfiles/bcp-index.txt
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/birthtoken ${pkgdir}/usr/share/miscfiles/birthtoken
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/cities.dat ${pkgdir}/usr/share/miscfiles/cities.dat
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/connectives ${pkgdir}/usr/share/miscfiles/connectives
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/countries ${pkgdir}/usr/share/miscfiles/countries
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/currency ${pkgdir}/usr/share/miscfiles/currency
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/fyi-index.txt ${pkgdir}/usr/share/miscfiles/fyi-index.txt
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/GNU-manifesto ${pkgdir}/usr/share/miscfiles/GNU-manifesto
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/inter.phone ${pkgdir}/usr/share/miscfiles/inter.phone
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/languages ${pkgdir}/usr/share/miscfiles/languages
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/latin1 ${pkgdir}/usr/share/miscfiles/latin1
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/mailinglists ${pkgdir}/usr/share/miscfiles/mailinglists
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/na.phone ${pkgdir}/usr/share/miscfiles/na.phone
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/na.postalcodes ${pkgdir}/usr/share/miscfiles/na.postalcodes
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/operator ${pkgdir}/usr/share/miscfiles/operator
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/propernames ${pkgdir}/usr/share/miscfiles/propernames
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/rfc-index.txt ${pkgdir}/usr/share/miscfiles/rfc-index.txt
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/std-index.txt ${pkgdir}/usr/share/miscfiles/std-index.txt
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/top-level.domains ${pkgdir}/usr/share/miscfiles/top-level.domains
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/unicode ${pkgdir}/usr/share/miscfiles/unicode
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/web2 ${pkgdir}/usr/share/dict/web2
  install -m0644 ${srcdir}/${pkgname}-${pkgver}/web2a ${pkgdir}/usr/share/dict/web2a

}