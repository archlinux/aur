# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=vault-kv-search
pkgver=0.1.0
pkgrel=2
pkgdesc='Recursively search Hashicorp Vault for a substring.'
arch=('x86_64')
url="https://github.com/xbglowx/${pkgname}"
license=('Mozilla Public License Version 2.0')
depends=('glibc')
optdepends=(
    'vault: in order to interact more with vault',
)

source=("${pkgname}-${pkgver}-src.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.linux-amd64.tar.gz")
validpgpkeys=('SKIP')
sha256sums=('0ee31ab1dc5e9ef0e0aa66e75f1cba86676d0c99010196947fdfb0a73b35e547')

package() {
    install -m755 vault-kv-search "${pkgdir}"/usr/bin/
}
