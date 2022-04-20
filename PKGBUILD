# Maintainer: Xyem <xyem@electricjungle.org>
pkgname=sheepit-client-launcher
pkgver=0.0.0
pkgrel=3
pkgdesc="A launcher for the SheepIt client, which always uses the latest released version"
arch=('any')
license=('GPL2')
depends=('java-runtime>=11')
source=("sheepit-client-launcher.sh")
sha256sums=('ed0f9bee924c757b7aba6d30b43ebe7bd05e721693e8e2855322fa3a37c42c1a')

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}";
}
