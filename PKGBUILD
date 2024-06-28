_appname='aiac'
pkgname="${_appname}-bin"
pkgver=5.0.1
pkgrel=1
pkgdesc='Artificial Intelligence Infrastructure-as-Code Generator'
arch=('x86_64')
url="https://github.com/gofireflyio/${_appname}"
license=('Apache-2.0')
source=("$url/releases/download/v$pkgver/${_appname}_${pkgver}_linux-amd64.tar.gz")
sha256sums=('9fa0fd8e0383a28ee0d88f7696ea4bfbbfe4ffeabdd3eef1c0e39fbb866583ff')
provides=("${_appname}")
conflicts=("${_appname}")

package() {
  cd "${srcdir}"
  install -Dm755 $_appname "$pkgdir"/usr/bin/$_appname
}
