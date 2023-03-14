# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sengi-bin
_pkgname=sengi
pkgver=1.2.0
pkgrel=1
pkgdesc="Mastodon & Pleroma Multi-account Desktop Client"
arch=('x86_64')
url="https://github.com/NicolasConstant/sengi"
license=('AGPL3')
conflicts=(sengi)
depends=(nss at-spi2-core alsa-lib gtk3)
options=()
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/${pkgver}/Sengi-${pkgver}-linux.deb")
sha512sums=('1737702ecc1cf16d3df3941eff269cb0c0893117b4e849960ff65a672a4ce1f7cb14bf530d73f7bc5c17c4333eacfee94be1149dedb030c102cd19d9ac40cdaf')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
}