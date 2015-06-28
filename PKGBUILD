# Maintainer: Loïc Guitaut <flink at belfalas dot eu>
pkgname=hall
pkgver=0.5.8
pkgrel=1
pkgdesc="Real-time chat & texting for business teams"
arch=('x86_64')
url="https://hall.com/"
license=('custom:proprietary')
depends=('qt5-webkit>=5.2.1')
source=("https://hall.com/desktop/Hall_${pkgver}_amd64.deb")
sha256sums=('227a31c1ee85104832601a52bed316107a11ab06616bdd463b720d35438e212d')

package() {
  tar xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
