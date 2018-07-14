# Maintainer: Nikita Bobko <nikitabobko (at) gmail (dot) com>

pkgname=gcal-notifier-kotlin-gtk
pkgver=1.0
pkgrel=1
pkgdesc="Simple Google Calendar notifier for Linux written on Kotlin using GTK lib"
arch=('x86_64' 'i686')
url="https://github.com/nikitabobko/gcal-notifier-kotlin-gtk"
license=('GPL')
depends=('java-gnome')
source=("https://github.com/nikitabobko/gcal-notifier-kotlin-gtk/releases/download/v$pkgver/gcal-notifier-kotlin-gtk.tar")
sha256sums=("cdcbb4c3f7221345b3f76a92ab4050a5013ca371cab5e9fb05f03fc54852eba9")

package() {
    cd ${srcdir}/gcal-notifier-kotlin-gtk-release
    ./install.sh $pkgdir/
}
