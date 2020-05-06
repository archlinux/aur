# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=trespass
pkgver=0.7.6
pkgrel=2
pkgdesc="A secure password keeper written in python using gpg to protect account/user and user/password key value stores"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/trespass'
depends=('python' 'python-numpy' 'gnupg' 'python-pyperclip' 'python-pygpgme')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/trespass/master/trespass/trespass")
md5sums=('d6743704b5bcc2c63c9906ccef746c1f')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "trespass" "$pkgdir/usr/bin/"
}
