# Maintainer: Arctic Ice Studio <development@arcticicestudio.com>
pkgname=nord-konsole
pkgver=0.1.0
pkgrel=1
pkgdesc="An arctic, north-bluish clean and elegant Konsole color scheme"
arch=("any")
url="https://github.com/arcticicestudio/nord-konsole"
license=("Apache", "CC-BY-SA-4.0")
depends=("konsole")
makedepends=("git")
source=("$pkgname::git+https://github.com/arcticicestudio/nord-konsole.git#tag=v$pkgver")
md5sums=("SKIP")

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 "src/nord.colorscheme" "$pkgdir/usr/share/konsole/nord.colorscheme"
}
