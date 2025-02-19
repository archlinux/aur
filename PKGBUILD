# Maintainer: atomicfs

pkgname=distro-info-data-fedora
pkgver=0.0.2
pkgrel=1
pkgdesc="Information about all releases of Fedora (data files)"
url=""
arch=(any)
license=(MIT)
source=("fedora.csv")
sha256sums=('0b1a17443166f1fcaf9264f37d3cc0b7596061ae33771e380e1057bca605023c')

package() {
  install -Dm755 -d "${pkgdir}/share/distro-info"
  install -Dm644 "fedora.csv" "${pkgdir}/usr/share/distro-info/fedora.csv"
}

