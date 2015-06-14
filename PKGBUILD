# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

pkgname=vim-sensible
pkgver=1.1
pkgrel=1
pkgdesc="Vim sugar for the UNIX shell commands that need it the most, by tpope"
arch=('any')
url="https://github.com/tpope/${pkgname}"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c503b7e45659749a1644fbe04c9000446984a862582fa05f529bcf5543cf3341')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
    find * -maxdepth 0 -type d -exec cp -rt "${pkgdir}/usr/share/vim/vimfiles" '{}' \+
}
