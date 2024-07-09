# Maintainer: allddd <allddd (at) proton (dot) me>

pkgname=vim-plug
pkgver=0.14.0
pkgrel=1
pkgdesc='A vim plugin manager'
arch=('any')
url='https://github.com/junegunn/vim-plug'
license=('MIT')
depends=('vim')
provides=('vim-plug')
conflicts=('vim-plug')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a8e86db8c62deefa70057fd0abc81bc20e270ab9811eee3ccbe9ceafd3d8a876')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm644 plug.vim -t "${pkgdir}/usr/share/vim/vimfiles/autoload/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 doc/plug.txt -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim: ts=4 sw=4 et:
