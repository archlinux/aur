# Maintainer of rancher2: Daniel Haß <aur@hass.onl>
# Maintainer: Henning Surmeier <me@hensur.de>
pkgname=rancher16-cli-bin
pkgver=0.6.11
pkgrel=1
pkgdesc="The Rancher Command Line Interface (CLI) is a unified tool to manage your Rancher server. This version is for older rancher 1.6 servers."
arch=('x86_64')
url="https://github.com/rancher/cli"
license=('APACHE')
source=("https://github.com/rancher/cli/releases/download/v${pkgver}/rancher-linux-amd64-v${pkgver}.tar.xz")
sha256sums=("34a4e2bf3408551a2197bc126c1796a94afa60548cb3e829176b39a60eb51824")


package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/rancher-v${pkgver}/rancher $pkgdir/usr/bin/rancher16
}
