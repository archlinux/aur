# Maintainer: Nikita Bobko <nikitabobko (at) gmail (dot) com>

pkgname=gcal-notifier-kotlin-gtk
pkgver=2.0.2
pkgrel=1
pkgdesc="Simple Google Calendar notifier for Linux written on Kotlin using GTK lib"
arch=('x86_64' 'i686')
url="https://github.com/nikitabobko/gcal-notifier-kotlin-gtk"
license=('GPL')
depends=('java-gnome')
source=("https://github.com/nikitabobko/gcal-notifier-kotlin-gtk/releases/download/v${pkgver//_/-}/gcal-notifier-kotlin-gtk-${pkgver//_/-}.tar")
sha256sums=("8e4160fca696cbdb5c59b0a0d42e1569d302fe216c1d5b13e0cf9217aaae6951")

package() {
    cd ${srcdir}/gcal-notifier-kotlin-gtk-${pkgver}
    ./install.sh $pkgdir/
}
