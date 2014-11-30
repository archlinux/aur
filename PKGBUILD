# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=spelt
pkgver=0.1
pkgrel=2
pkgdesc="A simple graphical program that can be used to classify words in a language"
arch=('any')
url="http://translate.sourceforge.net/wiki/spelt/index"
license=('GPL')
depends=('gtk2' 'python2')
source=(http://downloads.sourceforge.net/translate/$pkgname-$pkgver.tar.gz)
md5sums=('63c6ed29a6bbd04906241e6d27a3a74f')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  python2 setup.py install --root="${pkgdir}"
}
