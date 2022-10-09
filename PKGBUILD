# Maintainer: Sravan Balaji <sr98vn@gmail.com>
pkgname=mangal-bin
pkgver=3.12.0
pkgrel=1
pkgdesc="The most advanced cli manga downloader in the entire universe!"
arch=('x86_64')
url="https://github.com/metafates/mangal"
license=('MIT')
provides=('mangal')
source=("https://github.com/metafates/mangal/releases/download/v${pkgver}/mangal_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('29185a06df27895654226d2b3f593db552a22b198168ca8e4119ecdc21c4238f')

package() {
	install -Dm755 ./mangal "$pkgdir/usr/bin/mangal"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/mangal/README.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/mangal-bin/LICENSE"
}
