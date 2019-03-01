# Maintainer: strahe <u@strahe.com>
pkgname=nap-bin
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="A fast reverse proxy client for napyy.com"
arch=('x86_64')
url="https://napyy.com"
license=('Apache')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://o.tc.ink/ddns-nap/$pkgver/nap_linux_amd64.tar.gz")
noextract=()
md5sums=("5f60c59532b9e033f759dbbfcda690db")
validpgpkeys=()

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}_linux_amd64/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
