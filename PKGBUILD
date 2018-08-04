# Maintainer: Nikita Bobko <nikitabobko (at) gmail (dot) com>

pkgname=gcal-notifier-kotlin-gtk
pkgver=1.0.4
pkgrel=1
pkgdesc="Simple Google Calendar notifier for Linux written on Kotlin using GTK lib"
arch=('x86_64' 'i686')
url="https://github.com/nikitabobko/gcal-notifier-kotlin-gtk"
license=('GPL')
depends=('java-gnome')
source=("https://github.com/nikitabobko/gcal-notifier-kotlin-gtk/releases/download/v$pkgver/gcal-notifier-kotlin-gtk-$pkgver.tar")
sha256sums=("8a8db32f73660d57ca3c1842aecc37f59e81a46d1cd1a5f719d4ece4f89e982c")

package() {
    cd ${srcdir}/gcal-notifier-kotlin-gtk-release
    ./install.sh $pkgdir/
}
