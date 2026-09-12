# Maintainer: Taygun86

pkgname=zapret-gtk
pkgver=0.5.3
pkgrel=1
pkgdesc="GUI client for Zapret DPI Bypass"
arch=('x86_64')
url="https://github.com/Taygun86/zapret-gtk"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'iptables' 'ipset' 'curl' 'git' 'polkit')
provides=("zapret-gtk=$pkgver")
conflicts=('zapret-gtk-bin' 'zapret-gtk-git')
source=("$pkgname-$pkgver.deb::https://taygun86.github.io/taygun86-repo/deb/zapret-gtk_${pkgver}-1_amd64.deb")
sha256sums=('11666715772114609da74e927d5b5e8f2374db4b9af0ef01a78ac79a9f5ccfda')

package() {
  tar -xf data.tar.xz -C "$pkgdir/"
}
