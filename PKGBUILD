# Maintainer: yskszk63 <yskszk63 at gmail dot com>
pkgname=renvim-bin
pkgver=0.0.6
pkgrel=1
pkgdesc='Open the file in the outer Neovim instance.'
arch=('x86_64')
url='https://github.com/yskszk63/renvim'
license=('MIT', 'Apache-2.0')
depends=('neovim')
source=("${url}/releases/download/v${pkgver}/renvim_${pkgver}_linux_amd64.tar.gz")
b2sums=('f8c575566f1d107bc77c68ecb65d7dbf51d6137e731958ea192c9760fe4213ed61d0924d5381e077238e774e14f8400359f8eedddee22b34f2094a08efd81469')

package() {
    install -dm755 ${pkgdir}/usr/bin
    install -m755 ${srcdir}/renvim ${pkgdir}/usr/bin
}
