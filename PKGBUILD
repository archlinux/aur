# Maintainer: Randy Josleyn <randy.josleyn@gmail.com>
pkgname=mmt-bin
_pkgname=mmt
pkgver=1.8
pkgrel=1
pkgdesc="Media management tool for GoPros and other action cameras"
arch=('x86_64')
url="https://github.com/KonradIT/mmt"
license=()
groups=()
depends=()
makedepends=()
optdepends=()
provides=('mmt')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_prefix="https://github.com/KonradIT/mmt/releases/download/v1.8"
_source="${_pkgname}_${pkgver}_linux_amd64.tar.gz"
source=(${_prefix}/${_source})
noextract=()
sha256sums=('c92f464a4a50ea016ce4d5e6741493856c7025c4764089a47bf5732f748cd748')

prepare() {
  cd "${srcdir}"
  tar -xf "$_source"
}

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/local/bin/${_pkgname}"
}
