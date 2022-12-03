# Maintainer Filip Parag <aur@filiparag.com>
pkgname="otf-srbija-sans"
pkgver="1.01"
pkgrel=1
pkgdesc="Srbija Sans Font - sans serif typeface"
arch=("any")
url="https://srbija-font.webflow.io/"
license=("custom")
makedepends=()
provides=()
source=("https://www.dropbox.com/s/3o20xbhsikxnyth/SrbijaSans.zip?dl=1")
sha1sums=("31824a836b56d2edcc63f7f1e49e447512a31512")

package() {
  install -m644 -D "./Web-PS/Srbija Sans.otf" "$pkgdir/usr/share/fonts/$pkgname/srbija-sans.otf"
  install -m644 -D "./Uslovi za korišćenje fonta (002).docx" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.docx"
}
