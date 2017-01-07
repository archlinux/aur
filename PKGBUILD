# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=trespass
pkgver=0.0.2
pkgrel=1
pkgdesc="A secure password keeper written in python using gpg to protect account/user and user/password key value stores"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/trespass'
depends=('python' 'python-numpy' 'gnupg')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/trespass/master/trespass.py")
md5sums=('e37c77ad4e1a5f26a2bacbe2247cb4a8')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "trespass.py" "$pkgdir/usr/bin/"
}
