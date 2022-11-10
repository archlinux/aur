# Maintainer: Sravan Balaji <sr98vn@gmail.com>
pkgname=mangal-bin
pkgver=4.0.3
pkgrel=1
pkgdesc="The most advanced cli manga downloader in the entire universe!"
arch=('x86_64')
url="https://github.com/metafates/mangal"
license=('MIT')
provides=('mangal')
source=("https://github.com/metafates/mangal/releases/download/v${pkgver}/mangal_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('42efff875b7fb89b19b47ac4af73c114792ce9ad30e05bf6f4c691149031bbd0')

package() {
	install -Dm755 ./mangal "$pkgdir/usr/bin/mangal"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/mangal/README.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/mangal-bin/LICENSE"
}
