# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=vault-kv-search
pkgver=0.1.1
pkgrel=2
pkgdesc='Recursively search Hashicorp Vault for a substring.'
arch=('x86_64')
url="https://github.com/xbglowx/${pkgname}"
license=('MPL2')
depends=('glibc')
optdepends=(
    'vault: in order to interact more with vault',
)

source=("${pkgname}-${pkgver}-src.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.linux-amd64.tar.gz")
validpgpkeys=('SKIP')
sha256sums=('7534451aaecd4ec09046b6ba26872f6cfefdf9d30a712d79cf4a938623936240')

package() {
    install -D -m0755 vault-kv-search "${pkgdir}/usr/bin/vault-kv-search"
}
