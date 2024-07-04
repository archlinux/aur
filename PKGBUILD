# Maintainer: allddd <allddd (at) proton (dot) me>

pkgname=vim-plug
pkgver=0.13.0
pkgrel=1
pkgdesc='A vim plugin manager'
arch=('any')
url='https://github.com/junegunn/vim-plug'
license=('MIT')
depends=('vim')
provides=('vim-plug')
conflicts=('vim-plug')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('682c8629d766236dc4c8bd16c545b8d9ca58cd06de2b1887b061d24c6b022903')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm644 plug.vim -t "${pkgdir}/usr/share/vim/vimfiles/autoload/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 doc/plug.txt -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim: ts=4 sw=4 et:
