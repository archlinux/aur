# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=trespass
pkgver=0.0.1
pkgrel=1
pkgdesc="A secure password keeper written in python using gpg to protect account/user and user/password key value stores"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/trespass'
depends=('python' 'python-numpy' 'gpg2')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/trespass/master/trespass.py")
md5sums=('4ee384218bbc873e6770dd315c7984e8')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "trespass.py" "$pkgdir/usr/bin/"
}
