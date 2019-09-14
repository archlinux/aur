# Maintainer: Nikita Bobko <echo bmlraXRhYm9ia29AZ21haWwuY29tCg== | base64 -d>

pkgname=gcal-notifier-kotlin-gtk
pkgver=2.0.6
pkgrel=1
pkgdesc='Simple Google Calendar notifier for Linux written in Kotlin using GTK lib'
arch=('x86_64' 'i686')
url='https://github.com/nikitabobko/gcal-notifier-kotlin-gtk'
license=('GPL')
depends=('java-gnome-bin' 'java-runtime=8' 'libnotify' 'librsvg')
source=("https://github.com/nikitabobko/gcal-notifier-kotlin-gtk/releases/download/v${pkgver//_/-}/gcal-notifier-kotlin-gtk-v${pkgver//_/-}.tar")
sha256sums=("b343b0ee1959c0374962fe8825474fcb14a56be1cf8736000723b7504d594d7a")

package() {
    cd ${srcdir}/gcal-notifier-kotlin-gtk-v${pkgver}
    ./install.sh $pkgdir/
}
