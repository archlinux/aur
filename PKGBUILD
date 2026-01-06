# Maintainer: witt <1989161762 at qq dot com>

pkgname=jumpserver-client-bin
pkgver=4.1.1
pkgrel=1
pkgdesc="JumpServer linux Client."
arch=("x86_64")
#arch=("x86_64" "aarch64")
url="https://www.jumpserver.com"
license=("custom")
options=('!strip')
provides=('jumpserver-client')
conflicts=('jumpserver-client')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/jumpserver/clients/releases/download/v${pkgver}/JumpServerClient_${pkgver}_amd64.deb")
#source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://github.com/jumpserver/clients/releases/download/v${pkgver}/JumpServer-Client-Installer-linux-v${pkgver}-arm64.deb")
sha256sums_x86_64=('8978509d1d02c28ead167f225208c625822196d9e16ffef876f0aef10f40b450')
#sha256sums_aarch64=('b29602c48c1ffe11174b76d023f313f3cfcc81c64b075d9c20f7ab21221512a0')

prepare() {
    tar -xf data.tar.gz -C "${srcdir}"
}

package() {
    #cp -r "${srcdir}/opt" "${pkgdir}/"
    cp -r "${srcdir}/usr" "${pkgdir}/"
}

