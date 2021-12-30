pkgname=sttr
pkgver=0.2.12
pkgrel=1
pkgdesc='cli app to perform various operations on string'
arch=('x86_64')
url="https://github.com/abhimanyu003/sttr"
makedepends=()
source=("$url/releases/download/v$pkgver/sttr_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d5ebaf6e1305945d7a8ebb461d1d033fa6398c5d4085f5574c965db78fd469d6')

package() {
  install -Dm755 ./sttr "${pkgdir}/usr/bin/sttr"
}
