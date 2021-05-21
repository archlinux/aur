# Author: Hunter Wittenborn <hunter@hunterwittenborn.com>
# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>

pkgname=makedeb-db
pkgver=2.3.0
pkgrel=1
pkgdesc="Dependency conversion tool for makedeb"
arch=("any")
license=("GPL3")
url="https://github.com/hwittenborn/makedeb-db"

source=("https://repo.hunterwittenborn.com/debian/makedeb/pool/m/makedeb-db/makedeb-db_${pkgver}-${pkgrel}_all.deb")
sha256sums=("SKIP")

package() {
  # Extract package to $pkgdir
  tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"/
}
