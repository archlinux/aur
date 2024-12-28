# Maintainer: Hossam Mostafa <hossamdash2@gmail.com>
_pkgname=kubectl-explore
pkgname=kubectl-explore-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A kubectl plugin to interactively explore API resources through a TUI"
arch=('x86_64')
url="https://github.com/keisku/kubectl-explore"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")

source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('143a38bee32a039c4d59a04bc9565f2a9c0e385727267137c670c6102a7232b3')

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
}
