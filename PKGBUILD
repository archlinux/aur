# Maintainer: yskszk63 <yskszk63 at gmail dot com>
pkgname=renvim-bin
pkgver=0.0.3
pkgrel=3
pkgdesc='Open the file in the outer Neovim instance.'
arch=('x86_64')
url='https://github.com/yskszk63/renvim'
license=('MIT', 'Apache-2.0')
depends=('neovim')
source=("${url}/releases/download/v${pkgver}/renvim_${pkgver}_Linux_x86_64.tar.gz")
b2sums=('e13479799a759af8f6b9cb7a60167595f8c30a2e08be865b40e4fe94b762f036801c6e4b619f9477cafd564957fc0503d32841e305302d7887b30a2bd42b084b')

package() {
    install -dm755 ${pkgdir}/usr/bin
    install -m755 ${srcdir}/renvim ${pkgdir}/usr/bin
}
