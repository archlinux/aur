pkgname=sttr
pkgver=0.2.14
pkgrel=1
pkgdesc='cli app to perform various operations on string'
arch=('x86_64')
url="https://github.com/abhimanyu003/sttr"
makedepends=()
source=("$url/releases/download/v$pkgver/sttr_${pkgver}_linux_amd64.tar.gz")
sha256sums=('832e2eaec253be4d4ea1b7bdabef34632989cc0527b8d3f58da7211f89410ec3')

package() {
  install -Dm755 ./sttr "${pkgdir}/usr/bin/sttr"
}
