# Maintainer: Tim Wanders <tim241@mailbox.org>
_pkgname=bunny
pkgname=bunny-git
pkgver=1
pkgrel=1
pkgdesc="A simple shell script wrapper around multiple package managers"
arch=('any')
url="https://gitlab.com/tim241/${_pkgname}"
license=('GPLv3')

depends=()

source=("git+https://gitlab.com/tim241/${_pkgname}.git")

sha256sums=('SKIP')

package() {
    cd "$_pkgname"
    make install prefix="/usr/" destdir="$pkgdir" -j1
}

