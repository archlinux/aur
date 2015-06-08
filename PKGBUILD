# Maintainer: Jonne Haß <me@mrzyx.de>
# Contributor: Cheng Ye <yecheng91@msn.com>

pkgname=gnome-shell-extension-extend-left-box-git
_gitname=extend-left-box
pkgver=4.f1a8893
pkgrel=1
pkgdesc="Extend left box of the GNOME Shell top panel."
arch=('any')
url="https://github.com/StephenPCG/extend-left-box"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
source=('git://github.com/StephenPCG/extend-left-box.git')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  install -dm755 "$pkgdir/usr/share/gnome-shell/extensions"
  cp -av "$srcdir/$_gitname/extend-left-box@linuxdeepin.com" "$pkgdir/usr/share/gnome-shell/extensions"
}
sha256sums=('SKIP')
