# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgname=pidgin-knotifications
pkgver=0.3.6
pkgrel=1
pkgdesc="A Pidgin plugin that provides KDE4/Gnome/Growl for Windows notifications"
arch=('any')
url="http://code.google.com/p/pidgin-knotifications/"
license=('GPL2')
depends=('pidgin' 'perl-libwww')
makedepends=('pkg-config')
optdepends=('kdebase-kdialog: KDE notification support'
  'libnotify: Gnome notification support')
source=("http://pidgin-knotifications.googlecode.com/files/knotifications-${pkgver}.pl")
sha256sums=('7088213bf11240f4f197017143aeef6b4b2025cfefb11bf8107868e3547d9091')

package() {
  install -D -m755 -v "${srcdir}"/knotifications-0.3.6.pl "${pkgdir}$(pkg-config --variable=plugindir purple)/knotifications.pl"
}

# vim:set ts=2 sw=2 et:
