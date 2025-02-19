# Maintainer: atomicfs

pkgname=distro-info-data-fedora
pkgver=0.0.1
pkgrel=1
pkgdesc="Information about all releases of Fedora (data files)"
url=""
arch=(any)
license=(MIT)
source=("fedora.csv")
sha256sums=('e1c62e4ab31bc9e033579bbc9145bc39b8c3bb029c2de5df0673930886f960c2')

package() {
  install -Dm755 -d "${pkgdir}/share/distro-info"
  install -Dm644 "fedora.csv" "${pkgdir}/usr/share/distro-info/fedora.csv"
}

