# Maintainer: Jan0660 <jan0660@tutanota.com>
pkgname=kittygifs-bin
pkgdesc="A tool to optimize your gifkittyposting, and of course posting of other gifs."
pkgver="0.5.0"
pkgrel=1
pkgbase=kittygifs-bin
arch=("x86_64")
url="https://github.com/Jan0660/kittygifs"
license=("AGPL3")
groups=()
makedepends=()
provides=("kittygifs")
conflicts=("kittygifs")
depends=("webkit2gtk-4.1" "appmenu-gtk-module" "gtk3" "libappindicator-gtk3")
optdepends=("xdotool: for automatic posting on Xorg" "ydotool: for automatic posting on Wayland(and Xorg)")
source=("https://github.com/Jan0660/kittygifs/releases/download/v0.5.0/kittygifs_0.5.0_amd64.deb")
sha256sums=("9fb121979925a9785c2df87b8a897cceb6770549e2c8aaff8e7eef33b0137534")

package() {
    tar -xf data.tar.gz -C "$pkgdir"
    chmod +x $pkgdir/usr/bin/kittygifs
}
