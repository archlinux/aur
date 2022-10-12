pkgname=sttr
pkgver=0.2.13
pkgrel=1
pkgdesc='cli app to perform various operations on string'
arch=('x86_64')
url="https://github.com/abhimanyu003/sttr"
makedepends=()
source=("$url/releases/download/v$pkgver/sttr_${pkgver}_linux_amd64.tar.gz")
sha256sums=('6db77499d9154878329243ad8cee1fc476e0a0a856d5ee4bb35e13a4237e94b5')

package() {
  install -Dm755 ./sttr "${pkgdir}/usr/bin/sttr"
}
