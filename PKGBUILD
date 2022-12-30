# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=waybar-livestatus
pkgver=1.2.0
pkgrel=3
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
    "${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_Linux_aarch64.tar.gz.sig")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3', 'C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums_x86_64=('9d55add4ebf28bb0631d6d6f00b43a99f1364508fa572c65cf22b06d79bbdff5'
    'SKIP')
sha256sums_aarch64=('2ad9de372d7ded93da064cd4de12529300bc02d1c11be1519cc261c5d6b8004c'
    'SKIP')

package() {
    install -D -m0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
