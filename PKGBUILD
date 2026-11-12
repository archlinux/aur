# Maintainer: codekoala <arch@cloudlery.com>
pkgname=skysend-bin
pkgver=3.3.0
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
sha256sums_x86_64=('90a565dc7a328f85f8e6f0593cad6d61ec153c2d16cb71af92041e9760f112d8')
sha256sums_aarch64=('06fcc0e641b214663aab07e628b2525f50855bd0b6a217835351f8e823cc9440')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/skysend"
}
