# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=rancher-cli-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="The Rancher Command Line Interface (CLI) is a unified tool to manage your Rancher server."
arch=('x86_64')
url="https://github.com/rancher/cli"
license=('APACHE')
source=("https://github.com/rancher/cli/releases/download/v${pkgver}/rancher-linux-amd64-v${pkgver}.tar.xz")
sha256sums=("97758eb58785ac911cd1201ef64eafb8be9a60dd251d02567b20726d2ca7ada6")


package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/rancher-v${pkgver}/rancher $pkgdir/usr/bin/rancher
}
