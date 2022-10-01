# Maintainer: Sravan Balaji <sr98vn@gmail.com>
pkgname=mangal-bin
pkgver=3.11.0
pkgrel=1
pkgdesc="The most advanced cli manga downloader in the entire universe!"
arch=('x86_64')
url="https://github.com/metafates/mangal"
license=('MIT')
provides=('mangal')
source=("https://github.com/metafates/mangal/releases/download/v${pkgver}/mangal_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('4a59bac7aa106247f5f6fd3e057f744688d38f4c04b1304697ae765b65e4a1b9')

package() {
	install -Dm755 ./mangal "$pkgdir/usr/bin/mangal"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/mangal/README.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/mangal-bin/LICENSE"
}
