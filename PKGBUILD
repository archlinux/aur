# Maintainer: Taygun86

pkgname=zapret-gtk
pkgver=0.5.5
pkgrel=1
pkgdesc="GUI client for Zapret DPI Bypass"
arch=('x86_64')
url="https://github.com/Taygun86/zapret-gtk"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'iptables' 'ipset' 'curl' 'git' 'polkit')
provides=("zapret-gtk=$pkgver")
conflicts=('zapret-gtk-bin' 'zapret-gtk-git')
source=("$pkgname-$pkgver.deb::https://taygun86.github.io/taygun86-repo/deb/zapret-gtk_${pkgver}-1_amd64.deb")
sha256sums=('f096b6067201966a1150d2b76798496a0f203caed39df701a54768ed35a7fed4')

package() {
  tar -xf data.tar.xz -C "$pkgdir/"
}
