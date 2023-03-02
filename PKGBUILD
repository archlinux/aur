# Maintainer: Anton <deripas@yandex.ru>
pkgname=pachca
pkgver=1.1.7
pkgrel=1
pkgdesc="Corporate messenger for modern teams"
arch=('x86_64')
url="https://www.pachca.com/"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'nss' 'at-spi2-core')
source=("https://github.com/pachca/pachca-desktop/releases/download/v${pkgver}/pachca_${pkgver}_amd64.deb")
md5sums=('585fb858a6e592453da557702f2271de')
options=(!strip)

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz -C "$pkgdir"
}
