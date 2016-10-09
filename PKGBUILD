#Maintainer: Shankar <hello[at]shankar[dot]im>
pkgname=wham
pkgver=1.0.0beta0
pkgrel=1
pkgdesc='Whichever Archlinux Mirrors [ Mirror selector for Archlinux ]'
arch=('any')
license=('GPL')
url='https://github.com/shankar/wham'
depends=('python')
optdepends=('rsync: rate rsync mirrors')
source=('https://github.com/shankar/wham/archive/v1.0.0beta0.tar.gz')
md5sums=('9da266d36aa92158e0bdba2bf9cb6da3')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --prefix='/usr/' --root="${pkgdir}"
}
