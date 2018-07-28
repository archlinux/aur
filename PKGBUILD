# Maintainer: Nikita Bobko <nikitabobko (at) gmail (dot) com>

pkgname=gcal-notifier-kotlin-gtk
pkgver=1.0.3
pkgrel=1
pkgdesc="Simple Google Calendar notifier for Linux written on Kotlin using GTK lib"
arch=('x86_64' 'i686')
url="https://github.com/nikitabobko/gcal-notifier-kotlin-gtk"
license=('GPL')
depends=('java-gnome')
source=("https://github.com/nikitabobko/gcal-notifier-kotlin-gtk/releases/download/v$pkgver/gcal-notifier-kotlin-gtk-$pkgver.tar")
sha256sums=("95f9592359c1c7842e6f3058a59143c7e010e8492bd7906f9cecfcc5eedc3e26")

package() {
    cd ${srcdir}/gcal-notifier-kotlin-gtk-release
    ./install.sh $pkgdir/
}
