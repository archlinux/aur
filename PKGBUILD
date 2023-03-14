# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clashr-auto-bin
_pkgname=clash-auto
pkgver=2.4.8
pkgrel=1
pkgdesc="use clash.meta & speedtest & easy to use"
arch=('x86_64')
url="https://clashr-auto.gitbook.io/"
_githuburl="https://github.com/ClashrAuto/Clashr-Auto-Desktop"
license=('unknown')
providers="ClashrAuto"
conflits=(	clash-for-windows clash-meta clash-verge)
depends=(nss at-spi2-core alsa-lib gtk3)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-amd64_${pkgver}_amd64.deb")
sha256sums=('96580e856ec3f28b9aab5fa298e33c09f4a6b90c2033117aa9ef5030761c32c6')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}