# Maintainer: Michael Straube <michael_straube web de>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

pkgname=spriteilluminator
pkgver=1.3.0
pkgrel=2
pkgdesc="Image manipulation tool designed with game developers in mind"
arch=('x86_64')
url="http://www.codeandweb.com"
license=('custom:spriteilluminator')
depends=('glib2' 'hicolor-icon-theme')
install='spriteilluminator.install'
source=("https://www.codeandweb.com/download/$pkgname/$pkgver/SpriteIlluminator-$pkgver-ubuntu64.deb")
sha1sums=('696a7012ee78166b9d67296626bce3d68839440c')

prepare() {
  tar -xvf data.tar.xz
}

package() {
  cp -r ./usr "$pkgdir"

  install -Dm644 ./usr/share/spriteilluminator/documents/LicenseAgreement.html \
    "$pkgdir/usr/share/licenses/$pkgname/LicenseAgreement.html"
}
