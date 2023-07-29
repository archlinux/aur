# Maintainer: Jan0660 <jan0660@tutanota.com>
pkgname=kittygifs-bin
pkgdesc="A tool to optimize your gifkittyposting, and of course posting of other gifs."
pkgver="0.2.0"
pkgrel=1
pkgbase=kittygifs-bin
arch=("x86_64")
url="https://github.com/Jan0660/kittygifs"
license=("AGPL3")
groups=()
makedepends=()
depends=("webkit2gtk-4.1" "appmenu-gtk-module" "gtk3" "libappindicator-gtk3" "xdotool")
source=("https://github.com/Jan0660/kittygifs/releases/download/v0.2.0/kittygifs_0.2.0_amd64.deb")
sha256sums=("f8a9d777e85477293c0d1a3b109e25e65610fe27d40faa4162e4c23534f5a0ad")

package() {
    tar -xf data.tar.gz -C "$pkgdir"
    chmod +x $pkgdir/usr/bin/kittygifs
}
