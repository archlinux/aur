# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=f5e7c3ea198066f0e1f1dd4f59e383bba61b9ae5
pkgname=zpm
pkgver=20160803
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
sha256sums=('5aff1528facd024503304a59abebebf2459b9e0dbe8351ea0b519703d2918470')

package() {
    install -d ${pkgdir}/usr/share/zpm
    cp -r ${srcdir}/${pkgname}-${_git}/{plugins,zpm.zsh,zshrc-example.zsh} ${pkgdir}/usr/share/zpm
    install -D -m644  ${srcdir}/${pkgname}-${_git}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
 
