# Maintainer: Rumata <Rumata01@github.com>
pkgname=petbottle-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Yerel not uygulamasi"
arch=('x86_64')
url="https://github.com/Rumata01/Petbottle-public"
license=('Apache-2.0')
provides=('petbottle')
conflicts=('petbottle')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://github.com/Rumata01/Petbottle-public/releases/download/v${pkgver}/petbottle_${pkgver}_amd64.deb")
sha256sums=('d407fc2aa8350b4e5cc49ccda6c0994959328196693651eabab320adbb874738')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
    chmod 755 "${pkgdir}/usr/bin/petbottle"
}
