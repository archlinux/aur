# Maintainer: codekoala <arch@cloudlery.com>
pkgname=skysend-bin
pkgver=2.12.1
pkgrel=1
pkgdesc='Command-line client for SkySend end-to-end encrypted file and note sharing'
arch=('x86_64' 'aarch64')
url='https://github.com/Skyfay/SkySend'
license=('AGPL-3.0-only')
depends=('glibc')
provides=('skysend')
conflicts=('skysend')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/skysend-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/skysend-linux-arm64")
sha256sums_x86_64=('a423bc417e58aa5e3ea3f6c5c7817bc132da829b90bf58f34856a52d6a8940dd')
sha256sums_aarch64=('434bb1307171be9190a9d8779b7aa00887b21818fea5ed2fed6f858677c64df8')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/skysend"
}
