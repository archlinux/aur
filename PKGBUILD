# $Id$
# Maintainer: Vetrert  <vetrert@nigge.rs>
# Maintainer: Ungentoo <gendev@protonmail.com>

pkgname=ebin
pkgver=0.6
pkgrel=3
pkgdesc="Spams a word of your choice on your terminal in rainbow colors."
url="https://github.com/GNUPlusVet/ebin"
arch=('any')
license=('GPLv3')
depends=('python' 'python-pip')
source=("https://github.com/GNUPlusVet/ebin/archive/master.zip")
md5sums=('c871fb420a61d46336a8b1d4520728a7')

package() {
  cd ebin-master
  python setup.py install -O1 --root=$pkgdir
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
