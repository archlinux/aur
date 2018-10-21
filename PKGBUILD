# Maintainer: Nikita Bobko <nikitabobko (at) gmail (dot) com>

pkgname=gcal-notifier-kotlin-gtk
pkgver=2.0
pkgrel=1
pkgdesc="Simple Google Calendar notifier for Linux written on Kotlin using GTK lib"
arch=('x86_64' 'i686')
url="https://github.com/nikitabobko/gcal-notifier-kotlin-gtk"
license=('GPL')
depends=('java-gnome')
source=("https://github.com/nikitabobko/gcal-notifier-kotlin-gtk/releases/download/v${pkgver//_/-}/gcal-notifier-kotlin-gtk-${pkgver//_/-}.tar")
sha256sums=("2813c91ddb5358b9bad24281b1fcb3770072e01f27acf4efd939a9b2d7228490")

package() {
    cd ${srcdir}/gcal-notifier-kotlin-gtk-release
    ./install.sh $pkgdir/
}
