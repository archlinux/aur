# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: rabyte <rabyte__gmail>

pkgname=drascula-audio-flac
pkgver=2.0
pkgrel=1
pkgdesc="Lossless music addon for Drascula"
arch=('any')
url="http://scummvm.sourceforge.net/"
license=('custom')
source=(http://downloads.sourceforge.net/scummvm/$pkgname-$pkgver.zip)
md5sums=('ca13eba7d0d1441631bd4c42a5714e32')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/share/drascula/
  install -m644 audio/*.flac "${pkgdir}"/usr/share/drascula/
  install -D -m644 readme.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
