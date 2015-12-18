# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=e2056faaad8dfd9dfc6de9c6487b571a9a264953 # lastest commit 20150806
pkgname=zpm
pkgver=20151218
pkgrel=1
pkgdesc="ZPM ( Zsh plugin manager ) is an yet another plugin manager for zsh similar to vim-plug"
arch=('any')
url="https://github.com/horosgrisa/${pkgname}"
license=('LGPL3')
depends=('zsh' 'git')
makedepends=()
install='zpm.install'
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('76fc2e1284bf923887b254abc06f1b401d2423e1a113aab872245cb0572f76da')

package() {
    install -d ${pkgdir}/usr/share/zpm
    cp -r ${srcdir}/${pkgname}-${_git}/{plugins,zpm.zsh,zshrc-example} ${pkgdir}/usr/share/zpm
    install -D -m644  ${srcdir}/${pkgname}-${_git}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
 