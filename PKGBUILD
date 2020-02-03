# Maintainer: Nikita Bobko <echo bmlraXRhYm9ia29AZ21haWwuY29tCg== | base64 -d>

pkgname=gcal-notifier-kotlin-gtk
pkgver=2.0.7
pkgrel=1
pkgdesc='Simple Google Calendar notifier for Linux written in Kotlin using GTK lib'
arch=('x86_64' 'i686')
url='https://github.com/nikitabobko/gcal-notifier-kotlin-gtk'
license=('GPL')
depends=('java-gnome-bin' 'java-runtime>=8' 'libnotify' 'librsvg')
source=("https://github.com/nikitabobko/gcal-notifier-kotlin-gtk/releases/download/v${pkgver//_/-}/gcal-notifier-kotlin-gtk-v${pkgver//_/-}.tar")
sha256sums=("e5084840fb1802d98569e7e97f2ae8a6b3d43a24c62560989736ea076ee72350")

package() {
  cd ${srcdir}/gcal-notifier-kotlin-gtk-v${pkgver}
  ./install.sh $pkgdir/
}
