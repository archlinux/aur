# Maintainer: Patrick Ulbrich <zulu99 at gmx . net>
# Contributor: rasmus <rasmus . pank at gmail . com>

pkgname=mailnag
pkgver=1.1.0
pkgrel=1
pkgdesc="An extensible mail notification daemon"
arch=('any')
url="https://github.com/pulb/mailnag"
license=('GPL')
depends=('python2-gobject' 'python2-xdg' 'python2-dbus' 
         'libnotify' 'gst-plugins-base' 'gtk3' 'gdk-pixbuf2')
optdepends=('networkmanager: for connectivity detection',
        'libgnome-keyring: for save password storage in GNOME 3',
        'gnome-keyring: for save password storage in GNOME 3',
        'mailnag-goa-plugin: for GNOME Online Accounts integration',
        'mailnag-gnome-shell: for a tighter GNOME 3 integration')
makedepends=('gettext')
source=('https://github.com/pulb/mailnag/archive/v1.1.0.tar.gz')
md5sums=('479bc76816797cf0578c5b92849d2012')
install='mailnag.install'

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
}
