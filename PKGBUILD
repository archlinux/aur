# Maintainer: Patrick Ulbrich <zulu99 at gmx . net>

pkgname=mailnag-goa-plugin
pkgver=1.2.0
pkgrel=1
pkgdesc="Mailnag GNOME Online Accounts plugin"
arch=('any')
url="https://github.com/pulb/mailnag-goa-plugin"
license=('GPL')
depends=('mailnag' 'gnome-online-accounts')
source=('https://github.com/pulb/mailnag-goa-plugin/archive/v1.2.0.tar.gz')
md5sums=('daf94c7cc87c9c4ea65c92fd12f8a9e3')

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
}
