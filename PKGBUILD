# Maintainer: allddd <me (at) allddd (dot) onl>

pkgname=vim-plug
pkgver=0.15.0
pkgrel=1
pkgdesc='A vim plugin manager'
arch=('any')
url='https://github.com/junegunn/vim-plug'
license=('MIT')
depends=('vim')
provides=('vim-plug')
conflicts=('vim-plug')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('77009624d14a1a75b3108f40ebe48572ed14400360ce853ef2a9555bbe7c9fd7')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm644 plug.vim -t "${pkgdir}/usr/share/vim/vimfiles/autoload/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 doc/plug.txt -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim: ts=4 sw=4 et:
