# Maintainer: Rumata <Rumata01@github.com>
pkgname=petbottle-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Yerel not uygulamasi"
arch=('x86_64')
url="https://github.com/Rumata01/Petbottle-public"
license=('Apache-2.0')
provides=('petbottle')
conflicts=('petbottle')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://github.com/Rumata01/Petbottle-public/releases/download/v${pkgver}/petbottle_${pkgver}_amd64.deb")
sha256sums=('b6610fdf5eb6ff756b385a12b36f9137d03c188d62751b170854b649d0fea0dd')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
    chmod 755 "${pkgdir}/usr/bin/petbottle"
}