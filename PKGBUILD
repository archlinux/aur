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
sha256sums=('c2509c7f800c4021958678b440c5db3551def0a5bd05fc612ec2fa1edbd7ade5')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
    chmod 755 "${pkgdir}/usr/bin/petbottle"
}
