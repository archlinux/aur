# Author: Hunter Wittenborn <hunter@hunterwittenborn.com>
# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>

pkgname=makedeb-db
pkgver=1.0.2
pkgrel=2
pkgdesc="Dependency database for makedeb"
arch=("any")
license=("GPL3")

source=("https://repo.hunterwittenborn.com/debian/makedeb/pool/m/makedeb-db/makedeb-db_${pkgver}-${pkgrel}_all.deb")
sha256sums=("SKIP")

package() {
  # extract Debian package to $pkgdir
  tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"
}
