pkgname=otf-lulu-monospace
pkgver=1.0.0
pkgrel=1
pkgdesc="A free monospace font inspired by the digital age and neo-grotesque typography"
arch=('any')
url="http://www.steliosyps.com/lulu-monospace/"
license=('LicenseRef-None')
source=("http://www.steliosyps.com/s/LuluMonospace-Regular-a7lc.zip")
sha256sums=('8c12e257682c64d8dd046a140a155412a8749bcb5e76ff9c418b6b1bd465dbe1')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -t "$pkgdir/usr/share/fonts/TTF/" -Dm644 "LuluMonospace-Regular.otf"
}
