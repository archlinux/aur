# Maintainer: Hossam Mostafa <hossamdash2@gmail.com>
_pkgname=kubectl-explore
pkgname=kubectl-explore-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A kubectl plugin to interactively explore API resources through a TUI"
arch=('x86_64')
url="https://github.com/keisku/kubectl-explore"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")

source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('997e3134d7f29dd0634e4f0d1e5a8faef5312804c80e688791ec8b8f7fa1021d')

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
}
