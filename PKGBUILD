# Maintainer: Sravan Balaji <sr98vn@gmail.com>
pkgname=mangal-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="The most advanced cli manga downloader in the entire universe!"
arch=('x86_64')
url="https://github.com/metafates/mangal"
license=('MIT')
provides=('mangal')
source=("https://github.com/metafates/mangal/releases/download/v${pkgver}/mangal_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('f2355c7052beb4a83777915156a72db105c4c6b8808f187f75822ad42bb8668a')

package() {
	install -Dm755 ./mangal "$pkgdir/usr/bin/mangal"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/mangal/README.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/mangal-bin/LICENSE"
}
