_appname='aiac'
pkgname="${_appname}-bin"
pkgver=5.3.0
pkgrel=1
pkgdesc='Artificial Intelligence Infrastructure-as-Code Generator'
arch=('x86_64')
url="https://github.com/gofireflyio/${_appname}"
license=('Apache-2.0')
source=("$url/releases/download/v$pkgver/${_appname}_${pkgver}_linux-amd64.tar.gz")
sha256sums=('c11af7053dcbf946375670e022612ab8cec03973e3deb828cfe57d090a8ba606')
provides=("${_appname}")
conflicts=("${_appname}")

package() {
  cd "${srcdir}"
  install -Dm755 $_appname "$pkgdir"/usr/bin/$_appname
}
