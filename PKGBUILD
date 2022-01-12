# Maintainer: yskszk63 <yskszk63 at gmail dot com>
pkgname=renvim-bin
pkgver=0.0.2
pkgrel=1
pkgdesc='Open the file in the outer Neovim instance.'
arch=('x86_64')
url='https://github.com/yskszk63/renvim'
license=('MIT', 'Apache-2.0')
depends=('neovim')
source=("${url}/releases/download/v${pkgver}/renvim_${pkgver}_Linux_x86_64.tar.gz")
b2sums=('12230404350c5a0ed3261cfafad46777492694d4417af578dde5fe1e24866743bf418393836e9924b1436e3da1be5a7d2eb4ceffdccd9cd0f79d0d1a468257df')

package() {
    install -dm755 ${pkgdir}/usr/bin
    install -m755 ${srcdir}/renvim ${pkgdir}/usr/bin
}
