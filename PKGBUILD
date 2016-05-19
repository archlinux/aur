_name='zsh-navigation-tools'
pkgname="${_name}"
pkgver=2.1.16
pkgrel=1
pkgdesc="Curses-based tools for Zshell, e.g. multi-word history searcher"
url="http://github.com/psprint/zsh-navigation-tools"
arch=('any')
license=('GPL' 'MIT')
depends=('zsh>=4.3.17')
provides=('zsh-navigation-tools')
conflicts=('zsh-navigation-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/psprint/${pkgname}/archive/v${pkgver}.tar.gz")
install="${_name}.install"
md5sums=('6fd660543dd3efa49c3d985e98a649db')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
