# Maintainer: Taygun86

pkgname=zapret-gtk
pkgver=0.5.2
pkgrel=1
pkgdesc="GUI client for Zapret DPI Bypass"
arch=('x86_64')
url="https://github.com/Taygun86/zapret-gtk"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'iptables' 'ipset' 'curl' 'git' 'polkit')
provides=("zapret-gtk=$pkgver")
conflicts=('zapret-gtk-bin' 'zapret-gtk-git')
source=("$pkgname-$pkgver.deb::https://taygun86.github.io/taygun86-repo/deb/zapret-gtk_${pkgver}-1_amd64.deb")
sha256sums=('d0ba30f00fa64a10249e7af39bc72c8a8f8259d9e2c4f3d084362688efeeba4c')

package() {
  tar -xf data.tar.xz -C "$pkgdir/"
}
