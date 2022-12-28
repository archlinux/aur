# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=vault-kv-mv
pkgver=0.0.7
pkgrel=1
pkgdesc='Easily move Hashicorp Vault keys to different paths.'
arch=('x86_64' 'aarch64')
url="https://github.com/xbglowx/${pkgname}"
license=('MPL2')
depends=('glibc')
optdepends=(
    'vault: in order to interact more with vault',
)
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('c65f47558a2f0ed1d092b2b051617a3fdd61927f865a85bb213d12391be9f2e5')
sha256sums_aarch64=('b32bab398628b97ffc4b65a2c00762cdab0549309529b30e7abcb69984f8f3ae')
validpgpkeys=('SKIP')

package() {
    install -D -m0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
