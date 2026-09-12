# Maintainer: Taygun86

pkgname=zapret-gtk
pkgver=0.5.4
pkgrel=1
pkgdesc="GUI client for Zapret DPI Bypass"
arch=('x86_64')
url="https://github.com/Taygun86/zapret-gtk"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'iptables' 'ipset' 'curl' 'git' 'polkit')
provides=("zapret-gtk=$pkgver")
conflicts=('zapret-gtk-bin' 'zapret-gtk-git')
source=("$pkgname-$pkgver.deb::https://taygun86.github.io/taygun86-repo/deb/zapret-gtk_${pkgver}-1_amd64.deb")
sha256sums=('ec0142359fe4d9a0a86a4d185bda24b844ffe4b184d8861da487751f2c710b62')

package() {
  tar -xf data.tar.xz -C "$pkgdir/"
}
