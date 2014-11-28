# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=drascula-audio-mp3
pkgver=2.0
pkgrel=1
pkgdesc="Lossless music addon for Drascula"
arch=('any')
url="http://scummvm.sourceforge.net/"
license=('custom')
source=(http://downloads.sourceforge.net/scummvm/$pkgname-$pkgver.zip)
md5sums=('805c0c46b4efbea2a2f592d36736f9be')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/share/drascula/
  install -m644 audio/*.mp3 "${pkgdir}"/usr/share/drascula/
  install -D -m644 readme.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
