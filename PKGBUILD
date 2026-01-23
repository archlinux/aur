# Maintainer: Hossam Mostafa <hossamdash2@gmail.com>
_pkgname=kubectl-explore
pkgname=kubectl-explore-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="A kubectl plugin to interactively explore API resources through a TUI"
arch=('x86_64')
url="https://github.com/keisku/kubectl-explore"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")

source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('1969932b72b447c71e74346805caee0d0f3cbe59e964c5da008226b1bd12a1bf')

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
}
