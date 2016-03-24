# Maintainer: Patrick Ulbrich <zulu99 at gmx . net>
# Contributor: rasmus <rasmus . pank at gmail . com>

pkgname=mailnag
pkgver=1.2.0
pkgrel=1
pkgdesc="An extensible mail notification daemon"
arch=('any')
url="https://github.com/pulb/mailnag"
license=('GPL')
depends=('python2-gobject' 'python2-xdg' 'python2-dbus' 
         'libnotify' 'gst-plugins-base' 'gtk3' 'gdk-pixbuf2')
optdepends=('networkmanager: connectivity detection',
        'libgnome-keyring: safe password storage in GNOME 3',
        'gnome-keyring: safe password storage in GNOME 3',
        'mailnag-goa-plugin: GNOME Online Accounts integration',
        'mailnag-gnome-shell: tighter GNOME 3 integration')
makedepends=('gettext')
source=('https://github.com/pulb/mailnag/archive/v1.2.0.tar.gz')
md5sums=('afde260255bd8e2ceb72ebe562a1f4ae')
install='mailnag.install'

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
}
