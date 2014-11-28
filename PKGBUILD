# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=spelt
pkgver=0.1
pkgrel=1
pkgdesc="A simple graphical program that can be used to classify words in a language."
arch=('i686' 'x86_64')
url="http://translate.sourceforge.net/wiki/spelt/index"
license=('GPL')
depends=('gtk2' 'python')
source=(http://downloads.sourceforge.net/translate/$pkgname-$pkgver.tar.gz)

md5sums=('63c6ed29a6bbd04906241e6d27a3a74f')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py install --root=${pkgdir} || return 1
}
