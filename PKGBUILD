# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

_filename=images_papirus.zip
pkgname=libreoffice-fresh-rpm-papirus-theme
pkgver=20150815
pkgrel=1
pkgdesc="Papirus icon theme for LibreOffice Fresh RPM"
arch=('any')
url="https://github.com/varlesh/papirus-pack-kde"
license=('GPL3')
depends=('libreoffice-fresh-rpm')
noextract=("${_filename}")
source=("${_filename}::${url}/raw/master/libreoffice-icons/${_filename}")
sha256sums=('8803e27cd248b8a0d3fbdd97a2e190b21adbe68e4b8708c739d8b738b9217a2f')


package() {
    install -D -m644 "${srcdir}/${_filename}" "${pkgdir}/opt/libreoffice5.0/share/config/${_filename}"
} 
