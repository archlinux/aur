#Maintainer: Shankar <hello[at]shankar[dot]im>
pkgname=wham
pkgver=1.0.0alpha
pkgrel=1
pkgdesc='Whichever Archlinux Mirrors [ Mirror selector for Archlinux ]'
arch=('any')
license=('GPL')
url='https://github.com/shankar/wham'
depends=('python')
optdepends=('rsync: rate rsync mirrors')
source=('https://github.com/shankar/wham/archive/v1.0.0alpha.tar.gz')
md5sums=('264d6d7563d8bf25d7ed7c4d1aac0658')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix='/usr/' --root="$pkgdir"
}
