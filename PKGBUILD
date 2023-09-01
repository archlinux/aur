# Maintainer: Anton <deripas@yandex.ru>
pkgname=pachca
pkgver=1.3.0
pkgrel=1
pkgdesc="Corporate messenger for modern teams"
arch=('x86_64')
url="https://www.pachca.com/"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'nss' 'at-spi2-core')
source=("https://github.com/pachca/pachca-desktop/releases/download/v${pkgver}/pachca_${pkgver}_amd64.deb")
md5sums=('b5d6a358533bbc0616b5c5676fe2e834')
options=(!strip)

package() {
    cd "${srcdir}"
    tar --zstd -cf data.tar.zst -C "$pkgdir"
}
