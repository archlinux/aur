# Maintainer: Liviu Cristian Mirea-Ghiban <contact at liviucmg dot com>
pkgname=pidgin-kwallet-plugin-git
pkgver=1
pkgrel=2
pkgdesc="A Pidgin plugin written in Perl for storing passwords using KWallet"
arch=(any)
url="https://gitorious.org/libpurple-kwallet-plugin"
license=('GPL')
depends=(perl-net-dbus)
source=("http://gitorious.org/libpurple-kwallet-plugin/libpurple-kwallet-plugin/blobs/raw/master/libpurple_kwallet_plugin.pl")
md5sums=('SKIP')

package() {
  install -D -m644 "$srcdir/libpurple_kwallet_plugin.pl" "${pkgdir}/usr/lib/pidgin/libpurple_kwallet_plugin.pl"
}
