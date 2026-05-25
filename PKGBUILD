# Maintainer: Austin Choi <austinch20@protonmail.com>
pkgname=botbox-bin
pkgver=2.5.3
pkgrel=1
pkgdesc='A CLI tool for scaffolding, configuring, and managing Discord bot projects'
arch=('x86_64' 'aarch64')
url='https://github.com/choice404/botbox'
license=('MIT')
depends=('glibc')
provides=('botbox')
conflicts=('botbox')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/botbox_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/botbox_Linux_arm64.tar.gz")
sha256sums_x86_64=('bc8f19cd11de73c0b2cb287cb4dc65ac06cf7a5ba2b748d130ab9ed08e518642')
sha256sums_aarch64=('31b465123588e238bb3b0c1b680b23ec9c22b161282bb5bf00930bd40214b335')

package() {
    install -Dm755 botbox "${pkgdir}/usr/bin/botbox"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
