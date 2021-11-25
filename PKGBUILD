# Maintainer: Joshua Smith <jsmithfpv@disroot.org>

pkgname=hvd_comic_serif_pro_font
_pkgname=HVD_Comic_Serif_Pro
pkgver=1
pkgrel=1
pkgdesc="The cool alternative to Comic Sans"
url="https://www.hvdfonts.com/fonts/hvd-comic-serif"
arch=(any)
license=(custom)
source=("https://www.hvdfonts.com/public/downloads/$_pkgname.zip")
sha256sums=('c883585be685573862633b8b6f21ac0723c519a51cc02676627fbc0a1c1ae602')

package() {
  cd $_pkgname
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%_font}" -m644 $_pkgname.otf
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 License.txt
}
