# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=dnglab-bin
pkgver=0.5.1
pkgrel=3
pkgdesc="Camera RAW to DNG file format converter"
arch=('aarch64' 'x86_64')
url="https://github.com/dnglab/dnglab"
license=('LGPL2.1')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'gcc-libs')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('0628d17de9838b76724ec14221ea09e02a12862dc50223150e942b54df6d030a')
sha256sums_x86_64=('661aee0dfeed35f3472d15fa48cb00fcfca738a3214cb296bdf2a1659e17f251')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}