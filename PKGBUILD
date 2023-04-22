# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=piscesys-cursor-themes-git
_pkgname=piscesys-cursor-themes
pkgver=0.9
pkgrel=1
pkgdesc="piscesys cursor dark/light themes"
arch=('any')
url="https://gitlab.com/piscesys/cursor-themes"
license=('GPL')
depends=()
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" "cutefish-cursor-themes-git")
source=("git+$url.git")
sha512sums=('SKIP')

package() {
  cd cursor-themes
  install -d "$pkgdir/usr/share/icons"
  cp -r pisces-dark pisces-light "$pkgdir/usr/share/icons"
}
