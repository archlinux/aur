# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: rabyte <rabyte__gmail>

pkgname=drascula-audio
pkgver=2.0
pkgrel=1
pkgdesc="Music addon for Drascula"
arch=('any')
url="http://scummvm.sourceforge.net/"
license=('custom')
source=(http://downloads.sourceforge.net/scummvm/$pkgname-$pkgver.zip)
md5sums=('4098145ef089e65f88a5f9f1e980073f')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/share/drascula/
  install -m644 audio/*.ogg "${pkgdir}"/usr/share/drascula/
  install -D -m644 readme.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
