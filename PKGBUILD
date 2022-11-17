# Maintainer: Anton <deripas@yandex.ru>
pkgname=pachca
pkgver=1.1.6
pkgrel=1
pkgdesc="Corporate messenger for modern teams"
arch=('x86_64')
url="https://www.pachca.com/"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'nss' 'at-spi2-core')
source=("https://github.com/pachca/pachca-desktop/releases/download/v${pkgver}/pachca_${pkgver}_amd64.deb")
md5sums=('f3cc4110bdea5167e6d454d83fca25b6')
options=(!strip)

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz -C "$pkgdir"
}
