# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=waybar-livestatus
pkgver=1.1.4
pkgrel=1
pkgdesc='Tiny waybar module to fetch new alerts from livestatus.'
arch=('x86_64' 'aarch64')
url="https://github.com/cyrinux/${pkgname}"
license=('ISC')
depends=('glibc' 'otf-font-awesome')
optdepends=(
    'mako: to get popup notifications',
)
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.linux-amd64.tar.gz"
    "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.linux-amd64.tar.gz.asc")
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.linux-arm64.tar.gz"
    "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.linux-arm64.tar.gz.asc")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3', 'C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums_x86_64=('60bae605765956e85e33a20df1a06b547b482fb2d2a2f81c6c181315b93491e4'
    'SKIP')
sha256sums_aarch64=('45638dc8e24a09407320aed8757c015f7352bdd13e2961fe3483fef7cb2cefe6'
    'SKIP')

package() {
    install -D -m0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
