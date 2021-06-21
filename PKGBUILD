# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>

pkgname=ct
pkgver=0.9.1
pkgrel=1
pkgdesc="Container Linux Config Transpiler"
arch=('any')
url='https://github.com/kinvolk/container-linux-config-transpiler'
license=('Apache')
makedepends=('git' 'go' 'make')
source=("git+https://github.com/kinvolk/container-linux-config-transpiler.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/container-linux-config-transpiler"

    make
}

package() {
    cd "${srcdir}/container-linux-config-transpiler"

    install -Dm755 bin/ct "${pkgdir}/usr/bin/ct"
}
