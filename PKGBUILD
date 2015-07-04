# Maintainer: Kevin K. <kbknapp@gmail.com>

_pkgname=docli
pkgname=${_pkgname}-bin
pkgrel=1
pkgver=0.1.0
pkgdesc="A command line utility for managing DigitalOcean infrastructure"
url="https://kbknapp.github.io/docli-rs"
arch=('x86_64')
license=('MIT')
makedepends=()
provides=('docli')
conflicts=('docli-git')
replaces=('docli-git')
backup=()
install=''
source=("http://wod.twentyfives.net/bin/${_pkgname}/${_pkgname}-${pkgver//_/-}-${CARCH}-linux.tar.gz")
sha256sums=('c2a3715fa2237a7bb7f5101cf13364c48093ef529c52421da61d89cf5fcb6ab7')

package() {
  cd "${srcdir}/${_pkgname}/"

  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -Dm 0755 bin/docli "${pkgdir}/usr/bin/${_pkgname}"
}

