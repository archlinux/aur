# Maintainer: Nikita Bobko <echo bmlraXRhYm9ia29AZ21haWwuY29tCg== | base64 -d>

pkgname=gcal-notifier-kotlin-gtk
pkgver=2.0.9
pkgrel=1
pkgdesc='Simple Google Calendar notifier for Linux written in Kotlin using GTK lib'
arch=('x86_64' 'i686')
url='https://github.com/nikitabobko/gcal-notifier-kotlin-gtk'
license=('GPL')
depends=('java-gnome-bin' 'java-runtime>=8' 'libnotify' 'librsvg')
source=("https://github.com/nikitabobko/gcal-notifier-kotlin-gtk/releases/download/v${pkgver//_/-}/gcal-notifier-kotlin-gtk-v${pkgver//_/-}.tar")
sha256sums=("751e2bf652cfa93ea7349527090522463385d49a32192c2f7b7082e0825bda1c")

package() {
  cd ${srcdir}/gcal-notifier-kotlin-gtk-v${pkgver}
  ./install.sh $pkgdir/
}
