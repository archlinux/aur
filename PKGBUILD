# Maintainer: Ľubomir 'The_K' Kučera <lubomir-kucera-jr-at-gmail-dot-com>

pkgname=ct
pkgver=0.4.2
pkgrel=1
pkgdesc="Container Linux Config Transpiler"
arch=('any')
url='https://github.com/coreos/container-linux-config-transpiler'
license=('Apache')
makedepends=('git' 'go' 'make')
source=("git+https://github.com/coreos/container-linux-config-transpiler.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/container-linux-config-transpiler"

    make
}

package() {
    cd "${srcdir}/container-linux-config-transpiler"

    install -Dm755 bin/ct "${pkgdir}/usr/bin/ct"
}
