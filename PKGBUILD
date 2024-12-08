# Maintainer: Sravan Balaji <sr98vn@gmail.com>
pkgname=mangal-bin
pkgver=4.0.6
pkgrel=3
pkgdesc="The most advanced cli manga downloader in the entire universe!"
arch=('x86_64')
url="https://github.com/metafates/mangal"
license=('MIT')
provides=('mangal')
source=("https://github.com/metafates/mangal/releases/download/v${pkgver}/mangal_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('396991e92e466849384aacbe338302b68592a4214dd14cd4ce62b05f7575fa61')
conflicts=('mangal')

package() {
  install -Dm755 ./mangal "$pkgdir/usr/bin/mangal"
  install -Dm644 ./README.md "$pkgdir/usr/share/doc/mangal/README.md"
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/mangal-bin/LICENSE"
}
