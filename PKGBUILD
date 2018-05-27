# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=rancher-cli-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="The Rancher Command Line Interface (CLI) is a unified tool to manage your Rancher server."
arch=('x86_64')
url="https://github.com/rancher/cli"
license=('APACHE')
source=("https://github.com/rancher/cli/releases/download/v${pkgver}/rancher-linux-amd64-v${pkgver}.tar.xz")
sha256sums=("7bf393d309eef7fa9cb4882e8ccdd750568b37ce6d8ff126dd299d1c15d03cfd")


package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/rancher-v${pkgver}/rancher $pkgdir/usr/bin/rancher
}
