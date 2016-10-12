#Maintainer: Shankar <hello[at]shankar[dot]im>
pkgname=wham
pkgver=1.0.0beta1
pkgrel=1
pkgdesc='Whichever Archlinux Mirrors [ Mirror selector for Archlinux ]'
arch=('any')
license=('GPL')
url='https://github.com/shankar/wham'
depends=('python')
optdepends=('rsync: rate rsync mirrors')
source=('https://github.com/shankar/wham/archive/v1.0.0beta1.tar.gz')
md5sums=('63d0a0612c1814deadf877f768004646')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --prefix='/usr/' --root="${pkgdir}"
}
