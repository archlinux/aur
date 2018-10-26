# Maintainer: Nikita Bobko <nikitabobko (at) gmail (dot) com>

pkgname=gcal-notifier-kotlin-gtk
pkgver=2.0.1
pkgrel=1
pkgdesc="Simple Google Calendar notifier for Linux written on Kotlin using GTK lib"
arch=('x86_64' 'i686')
url="https://github.com/nikitabobko/gcal-notifier-kotlin-gtk"
license=('GPL')
depends=('java-gnome')
source=("https://github.com/nikitabobko/gcal-notifier-kotlin-gtk/releases/download/v${pkgver//_/-}/gcal-notifier-kotlin-gtk-${pkgver//_/-}.tar")
sha256sums=("90d921f8cac4dd32140be497225d4c4718a14148db982e844aac7a1f1c573391")

package() {
    cd ${srcdir}/gcal-notifier-kotlin-gtk-release
    ./install.sh $pkgdir/
}
