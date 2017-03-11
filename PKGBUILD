# Maintainer: Arctic Ice Studio <development@arcticicestudio.com>
pkgname=nord-xfce-terminal
pkgver=0.1.0
pkgrel=1
pkgdesc="An arctic, north-bluish clean and elegant XFCE Terminal color theme"
arch=("any")
url="https://github.com/arcticicestudio/nord-xfce-terminal"
license=("Apache", "CC-BY-SA-4.0")
depends=("xfce4-terminal")
makedepends=("git")
source=("$pkgname::git+https://github.com/arcticicestudio/nord-xfce-terminal.git#tag=v$pkgver")
md5sums=("SKIP")

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 "src/nord.theme" "$pkgdir/usr/share/xfce4/terminal/colorschemes/nord.theme"
}
