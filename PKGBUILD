# Maintainer: Xyem <xyem@electricjungle.org>
pkgname=sheepit-client-launcher
pkgver=0.0.0
pkgrel=2
pkgdesc="A launcher for the SheepIt client, which always uses the latest released version"
arch=('any')
license=('GPL2')
depends=('java-runtime>=11')
source=("sheepit-client-launcher.sh")
sha256sums=('a7ea6fa214d77ff5eeb1c241fad621ce7b605a4f15f3431fab8d7f666916222f')

package() {
  install -Dm755 "${pkgname%}.sh" "${pkgdir}/usr/bin/${pkgname%}";
}
