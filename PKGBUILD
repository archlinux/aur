# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>
_pkgname=sail-isa-spec
pkgname=$_pkgname-bin
pkgver=0.19
pkgrel=1
pkgdesc="Sail architecture definition language"
arch=(x86_64)
url="https://github.com/rems-project/sail"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/releases/download/$pkgver-linux-binary/sail.tar.gz")
sha256sums=('0965ccab502312e01f02ada053df2aeca2437d59cb948373397029db740d7c86')

package() {
	install -d "${pkgdir}/usr/bin"
  	install -Dm644 "$srcdir/sail/LICENSE" "${pkgdir}/usr/share/licenses/sail/LICENSE"
  	install -Dm644 "$srcdir/sail/Z3_LICENSE" "${pkgdir}/usr/share/licenses/sail/Z3_LICENSE"
  	cp -r "$srcdir/sail/bin/" "$pkgdir/usr/"
  	cp -r "$srcdir/sail/share/" "$pkgdir/usr/"
}
