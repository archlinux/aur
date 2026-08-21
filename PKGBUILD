# Maintainer: Taygun86

pkgname=zapret-gtk
pkgver=0.5.0
pkgrel=1
pkgdesc="GUI client for Zapret DPI Bypass"
arch=('x86_64')
url="https://github.com/Taygun86/zapret-gtk"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'iptables' 'ipset' 'curl' 'git' 'polkit')
provides=("zapret-gtk=$pkgver")
conflicts=('zapret-gtk-bin' 'zapret-gtk-git')
source=("$pkgname-$pkgver.deb::https://taygun86.github.io/taygun86-repo/deb/zapret-gtk_${pkgver}-1_amd64.deb")
sha256sums=('a61554818c18bb691c5ef97c97d20af4e3ac77e4ed18f0f763a18c06e3234682')

package() {
  tar -xf data.tar.xz -C "$pkgdir/"
}
