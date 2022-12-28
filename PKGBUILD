# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=vault-kv-search
pkgver=0.1.1
pkgrel=3
pkgdesc='Recursively search Hashicorp Vault for a substring.'
arch=('x86_64' 'aarch64')
url="https://github.com/xbglowx/${pkgname}"
license=('MPL2')
depends=('glibc')
optdepends=(
    'vault: in order to interact more with vault',
)
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('7c151b72fca1023acc0ff71e2df70d4b3d4ce7aa9e3103e6af98ae5cdaba3a0c')
sha256sums_aarch64=('03c880bb5abe319d79965c61778826a4a1f162205006c26d883d5c8403dfd545')
validpgpkeys=('SKIP')

package() {
    install -D -m0755 vault-kv-search "${pkgdir}/usr/bin/vault-kv-search"
}
