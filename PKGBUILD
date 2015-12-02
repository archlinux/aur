# Maintainer: Patrick Ulbrich <zulu99 at gmx . net>

pkgname=mailnag-goa-plugin
pkgver=1.1.0
pkgrel=2
pkgdesc="Mailnag GNOME Online Accounts plugin"
arch=('any')
url="https://github.com/pulb/mailnag-goa-plugin"
license=('GPL')
depends=('mailnag' 'gnome-online-accounts')
source=('https://github.com/pulb/mailnag-goa-plugin/archive/v1.1.0.tar.gz')
md5sums=('29ae430c379c7f1b88ed104be55dba89')

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
}
