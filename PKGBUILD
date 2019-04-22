# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=trespass
pkgver=0.7.4
pkgrel=2
pkgdesc="A secure password keeper written in python using gpg to protect account/user and user/password key value stores"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/trespass'
depends=('python' 'python-numpy' 'gnupg' 'python-pyperclip' 'python-pygpgme')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/trespass/master/trespass/trespass")
md5sums=('c451159fdb50c4c7782bcb683d8ba947')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "trespass" "$pkgdir/usr/bin/"
}
