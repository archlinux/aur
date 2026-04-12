# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="network-monitor-bin"
pkgver="0.4.6"
pkgrel=1
pkgdesc="A real-time network connection monitoring tool built with Rust and GTK4, displaying active connections with live I/O statistics in a modern graphical interface"
url="https://github.com/grigio/network-monitor"
license=("GPL3")
arch=("x86_64")
depends=("gtk4" "libadwaita")
source=("network-monitor.desktop")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/grigio/network-monitor/releases/download/v$pkgver/network-monitor-x64.tar.gz")
b2sums=('b26148c283b7087648f96456e742e1a6fe3146abefe5123aa97e130a332d8011501ef498b3624929b2e54209063fc1fb755592c7b2193e0b879d5e07c78b9c41')
b2sums_x86_64=('ce117f03b2e3d62e70df3030b97a0f9409156d1b31da62eb7d8d4aa1a7e273327885d8fff01082a3cecea039520953644af22b6c201e4a59db3895f0a217da16')
options=("!strip")

package(){
 install -D -m 755 "network-monitor" -t "$pkgdir/usr/bin"
 install -Dm644 "network-monitor.desktop" -t "$pkgdir/usr/share/applications"
}
