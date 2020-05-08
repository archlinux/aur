pkgname=quivira
pkgver=4.1
pkgrel=1
pkgdesc="Good font for ancient greek"
arch=(any)
url="http://www.quivira-font.com/index.php"
source=("http://www.quivira-font.com/files/Quivira.otf")
sha256sums=(03c2f593b224efffceac6f7f3090cdc935f0817399fcc607e4c7cc1b097b3b5a)
package() {
cd "${srcdir}"
#mkdir -p /usr/share/fonts/quivira
install -Dm664 Quivira.otf -t "$pkgdir"/usr/share/fonts/quivira
}
