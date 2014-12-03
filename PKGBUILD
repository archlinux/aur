# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=evad
pkgver=0.0.2
pkgrel=3
pkgdesc="A text-based client to the powerful MPD music server"
arch=('any')
url="http://sourceforge.net/projects/evad/"
license=('GPL')
depends=('python2' 'mpd')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('4d49c3ad4574a0660b0b5a3153d22206c35800835a0318233875d9b1407dbae8')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  python2 setup.py install --root="${pkgdir}"
}
