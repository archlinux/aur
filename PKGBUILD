# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=waybar-livestatus
pkgver=1.2.0
pkgrel=1
pkgdesc='Tiny waybar module to fetch new alerts from livestatus.'
arch=('x86_64' 'aarch64')
url="https://github.com/cyrinux/${pkgname}"
license=('ISC')
depends=('glibc' 'otf-font-awesome')
optdepends=(
    'mako: to get popup notifications',
)
source_x86_64=("${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_Linux_x86_64.tar.gz"
    "${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_Linux_x86_64.tar.gz.sig")
source_aarch64=("${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_Linux_aarch64.tar.gz"
    "${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_Linux_x86_64.tar.gz.sig")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3', 'C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums_x86_64=('970b559e8905e5a9f8142da3966acef8bcbe073a191b39a3e90980da41a0a4bf'
    'SKIP')
sha256sums_aarch64=('c11af7e58dcb64ba7379df86c941cc39c33ba091943b5a8b309ff3c1e05cf80b'
    'SKIP')

package() {
    install -D -m0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
