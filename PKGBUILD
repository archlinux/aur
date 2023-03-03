# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vivlio-bin
_pkgname=Vivlio
pkgver=2.2.1
pkgrel=2
pkgdesc="Vivlio is an eBook reader in ePub and PDF format for PC (Windows or Linux) or Mac."
arch=('x86_64')
url="https://app.vivlio.com"
license=('unknow')
conflicts=()
depends=('alsa-lib' 'libxss' 'at-spi2-core' 'nss' 'gtk3')
options=()
source=("${_pkgname}-${pkgver}.deb::${url}/download/linux64/deb")
sha512sums=('5c0ec550ea5e9e7aa0711e9892d5808fa05e6bfadae0129a737f50c01aec57e5709adb50c2e281c1a599c5eb77d60c746fde30360d5837615847adedc4087a00')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
