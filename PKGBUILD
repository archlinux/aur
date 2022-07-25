# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

_pkgname=autotrace
pkgname="${_pkgname}-bin"
_date='20200219'
_revision='65'
_pkgver="0.40.0-$_date"
pkgver="${_pkgver/-/_}"
pkgrel=1
pkgdesc='AutoTrace is a utility for converting bitmap into vector graphics.'
arch=('i686' 'x86_64')
url='https://github.com/autotrace/autotrace.git'
license=('GPL' 'LGPL')
depends=('libpng' 'pstoedit' 'libmagick6' 'glib2')
provides=(autotrace)
conflicts=(autotrace-git)
source=("https://github.com/autotrace/autotrace/releases/download/travis-$_date.$_revision/${_pkgname}_${_pkgver}_all.deb")
sha512sums=('c0e49c213fca78079ae02bec44fa04707d2358ddc2a5e77d6e29e1ae47028d1b7f45d604acd0d47c28320e1217278780e61d122e5383a13675e9a8cf3b136bfc')

package() {
  cd "$srcdir"
  tar -xf data.tar.xz -C ${pkgdir}
}
