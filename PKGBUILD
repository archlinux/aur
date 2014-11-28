# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: abstracity <quarkin@gmail.com>

pkgname=archmage
pkgver=0.2.4
pkgrel=3
pkgdesc="An extensible reader and decompiler for files in the CHM format"
arch=('any')
url="http://archmage.sourceforge.net/"
license=('GPL')
depends=('python2-pychm' 'python-beautifulsoup')
optdepends=('lynx: for converting html to plain text'
            'elinks: for converting html to plain text'
            'htmldoc: for converting to single html and pdf formats'
            'mod_python: for apache/python integration')
backup=(etc/$pkgname/arch.conf)
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('de48cb2021c9ec199cf943d6cf764a550527fff775ae3ed817e4f25164709f53')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  python2 setup.py install --root=${pkgdir}
}
