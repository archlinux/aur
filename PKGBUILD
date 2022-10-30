# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=rancher-cli-bin
pkgver=2.6.9
pkgrel=1
pkgdesc="The Rancher Command Line Interface (CLI) is a unified tool to manage your Rancher server."
arch=('x86_64')
url="https://github.com/rancher/cli"
license=('APACHE')
source=("https://github.com/rancher/cli/releases/download/v${pkgver}/rancher-linux-amd64-v${pkgver}.tar.xz")
sha256sums=("54c9237e6148f1adae8b87b951b0df66f7b8bc62be38a53685207c185dde0027")


package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/rancher-v${pkgver}/rancher $pkgdir/usr/bin/rancher
}
