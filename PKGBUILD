# Maintainer: Sneakatoo <corinne.9@hotmail.it>

_pkgname=wanda-the-fish
pkgname=gnome-shell-extension-$_pkgname
pkgver=2.0
pkgrel=1
pkgdesc="Extension that adds 'Wanda the Fish' to the Shell top panel"
arch=('any')
url="https://gitlab.com/tallero/wandathefish"
license=('GPL3')
depends=('gnome-shell<1:47')
install=$_pkgname.install
_commit="aaf40ea73b0e3e27d8002b053d2881082d8f83d8"
source=("${_pkgname}::git+${url}#commit=${_commit}")
sha256sums=('SKIP')

package() {
  cd "${_pkgname}" 
  ls
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
  install -d "$pkgdir"/usr/share/gnome-shell/extensions
  cp -af "wandathefish@arcipelago.org" "$pkgdir"/usr/share/gnome-shell/extensions/
}
