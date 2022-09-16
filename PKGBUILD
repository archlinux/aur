# Maintainer: Sven Greb <development@arcticicestudio.com>
# Maintainer: Arctic Ice Studio <development@arcticicestudio.com>
pkgname=nord-gedit
pkgver=0.1.0
pkgrel=2
pkgdesc="An arctic, north-bluish clean and elegant gedit syntax theme"
arch=("any")
url="https://github.com/arcticicestudio/nord-gedit"
license=("MIT")
depends=("gedit")
makedepends=("git")
source=("$pkgname::git+https://github.com/arcticicestudio/nord-gedit.git#tag=v$pkgver")
md5sums=("SKIP")

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 "src/xml/nord.xml" "$pkgdir/usr/share/gtksourceview-3.0/styles/nord.xml"
  install -Dm644 "src/xml/nord.xml" "$pkgdir/usr/share/gtksourceview-4.0/styles/nord.xml"
  install -Dm644 "src/xml/nord.xml" "$pkgdir/usr/share/gtksourceview-5/styles/nord.xml"
}
