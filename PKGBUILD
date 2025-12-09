# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=rancher-cli-bin
pkgver=2.13.0
pkgrel=1
pkgdesc="The Rancher Command Line Interface (CLI) is a unified tool to manage your Rancher server."
arch=('x86_64')
url="https://github.com/rancher/cli"
license=('APACHE')
source=("https://github.com/rancher/cli/releases/download/v${pkgver}/rancher-linux-amd64-v${pkgver}.tar.xz")
sha256sums=("9c186ecd4cf2c2139d7939c297f7ef77f545e8aba2e0d8ac0d847ad97270d6c5")


package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/rancher-v${pkgver}/rancher $pkgdir/usr/bin/rancher
}
