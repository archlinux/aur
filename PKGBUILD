# Maintainer: Nikita Bobko <nikitabobko (at) gmail (dot) com>

pkgname=gcal-notifier-kotlin-gtk
pkgver=2.0.3
pkgrel=1
pkgdesc='Simple Google Calendar notifier for Linux written on Kotlin using GTK lib'
arch=('x86_64' 'i686')
url='https://github.com/nikitabobko/gcal-notifier-kotlin-gtk'
license=('GPL')
depends=('java-gnome')
source=("https://github.com/nikitabobko/gcal-notifier-kotlin-gtk/releases/download/v${pkgver//_/-}/gcal-notifier-kotlin-gtk-v${pkgver//_/-}.tar")
sha256sums=("13ffffb5dcb3c80f7d783210a93436d0a012cfc12ac1ad79cd78ffa3c06e2beb")

package() {
    cd ${srcdir}/gcal-notifier-kotlin-gtk-v${pkgver}
    ./install.sh $pkgdir/
}
