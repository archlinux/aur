# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=rancher-cli-bin
pkgver=0.6.8
pkgrel=1
pkgdesc="The Rancher Command Line Interface (CLI) is a unified tool to manage your Rancher server."
arch=('x86_64')
url="https://github.com/rancher/cli"
license=('APACHE')
source=("https://github.com/rancher/cli/releases/download/v${pkgver}/rancher-linux-amd64-v${pkgver}.tar.xz")
sha256sums=("53e7eb2831ae70c939986c3d58eb067ee678b6a19ab4f5179fb740174103eea0")


package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/rancher-v${pkgver}/rancher $pkgdir/usr/bin/rancher
}
