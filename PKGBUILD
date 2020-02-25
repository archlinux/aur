# Maintainer: Nikita Bobko <echo bmlraXRhYm9ia29AZ21haWwuY29tCg== | base64 -d>

pkgname=gcal-notifier-kotlin-gtk
pkgver=2.0.8
pkgrel=1
pkgdesc='Simple Google Calendar notifier for Linux written in Kotlin using GTK lib'
arch=('x86_64' 'i686')
url='https://github.com/nikitabobko/gcal-notifier-kotlin-gtk'
license=('GPL')
depends=('java-gnome-bin' 'java-runtime>=8' 'libnotify' 'librsvg')
source=("https://github.com/nikitabobko/gcal-notifier-kotlin-gtk/releases/download/v${pkgver//_/-}/gcal-notifier-kotlin-gtk-v${pkgver//_/-}.tar")
sha256sums=("f16153ce588ebd21f25d9e0cc1f0c618ec3c2699b453901354c847bc80baf828")

package() {
  cd ${srcdir}/gcal-notifier-kotlin-gtk-v${pkgver}
  ./install.sh $pkgdir/
}
