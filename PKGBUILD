# Maintainer: 4679 <4679@pm.me>

pkgname=rabbit-plugin-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='A SIP003 plugin based on rabbit-tcp for shadowsocks (binary version)'
arch=('x86_64')
url='https://github.com/ihciah/rabbit-plugin'
license=('unknown')
depends=('glibc')
provides=('rabbit-plugin')
conflicts=('rabbit-plugin')
source=("${pkgname}-${pkgver}.gz::${url}/releases/download/v${pkgver}/rabbit-plugin-linux-amd64.gz")
sha512sums=('956aef7e6a891318b339d9d96f34b6381378dc8677fc36c250929a384044a772c359e8cd47aba80d8e15679f9a10723cc111215bc9ef11ddfe74b8f5b8dd9ea4')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/rabbit-plugin"
}

