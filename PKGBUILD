# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="network-monitor-bin"
pkgver=0.7.6
pkgrel=1
pkgdesc="A real-time network connection monitoring tool built with Rust and GTK4, displaying active connections with live I/O statistics in a modern graphical interface"
url="https://github.com/grigio/network-monitor"
license=("GPL3")
arch=("x86_64")
depends=("gtk4" "libadwaita")
source=("network-monitor.desktop")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/grigio/network-monitor/releases/download/v$pkgver/network-monitor-x64.tar.gz")
b2sums=('b26148c283b7087648f96456e742e1a6fe3146abefe5123aa97e130a332d8011501ef498b3624929b2e54209063fc1fb755592c7b2193e0b879d5e07c78b9c41')
b2sums_x86_64=('202bb42b30f9bf4001a94e99f569e3890d697bdbb1e9c62073fe93c012d85660a7f31d2f537851ba5b46c87ee4ff1375af359aef7064e463ca49981f766e50ca')
options=("!strip")

package(){
 install -D -m 755 "network-monitor" -t "$pkgdir/usr/bin"
 install -Dm644 "network-monitor.desktop" -t "$pkgdir/usr/share/applications"
}
