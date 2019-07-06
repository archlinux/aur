# Maintainer: Henri van de Munt <(firstname) @ gmail.com>
pkgname=gnome-shell-extension-material-shell-git
pkgver=r34.763b039
pkgrel=1
pkgdesc="GNOME Shell Extension Material Shell"
arch=('any')
url="https://github.com/PapyElGringo/material-shell"
license=('GPL')
depends=('gnome-shell')
source=('git+https://github.com/PapyElGringo/material-shell.git')
md5sums=('SKIP')
prepare() {
 ls -l



 cd material-shell

 printf '0+%s+g%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}
package() {
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/material-shell@papyelgringo/"
  cp -r material-shell/. "$pkgdir/usr/share/gnome-shell/extensions/material-shell@papyelgringo/"
}
