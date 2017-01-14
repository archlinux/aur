# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=trespass
pkgver=0.0.
pkgrel=1
pkgdesc="A secure password keeper written in python using gpg to protect account/user and user/password key value stores"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/trespass'
depends=('python' 'python-numpy' 'gnupg')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/trespass/master/trespass")
md5sums=('bc6ee2bd0dffc315ffd4d5305dadae40')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "trespass" "$pkgdir/usr/bin/"
}
