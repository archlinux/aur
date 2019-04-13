# Maintainer: Nikita Bobko <nikitabobko (at) gmail (dot) com>

pkgname=gcal-notifier-kotlin-gtk
pkgver=2.0.5
pkgrel=1
pkgdesc='Simple Google Calendar notifier for Linux written in Kotlin using GTK lib'
arch=('x86_64' 'i686')
url='https://github.com/nikitabobko/gcal-notifier-kotlin-gtk'
license=('GPL')
depends=('java-gnome-bin' 'java-runtime=8' 'libnotify' 'librsvg')
source=("https://github.com/nikitabobko/gcal-notifier-kotlin-gtk/releases/download/v${pkgver//_/-}/gcal-notifier-kotlin-gtk-v${pkgver//_/-}.tar")
sha256sums=("4ec580e84648a30dc002fdfe55e32cd7b002945829949b3a957b28769f0ea5b2")

package() {
    cd ${srcdir}/gcal-notifier-kotlin-gtk-v${pkgver}
    ./install.sh $pkgdir/
}
