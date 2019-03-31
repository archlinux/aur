# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>

pkgname='shahab-fonts'
pkgver=0.0.2
pkgrel=1
pkgdesc='Shahab is a Persian/Arabic font.'
url='https://github.com/font-store/ShahabFont'
arch=(any)
license=('OFL-1.1')
depends=('fontconfig')
provides=('ttf-shahab')
conflicts=('ttf-shahab')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/pack.${pkgver}.zip")
sha512sums=('87ee2a2e84ac20cf69227bd997c9287ccf25faec3243cb0dcd536c3903c140f73cdd3c3b22db1b759e9f27b74b80391fe5591799725946bece19170550259bc4')

package() {
    install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./fonts/*.ttf
}
