# Maintainer: Alexandre Magno <alexandre.mbm@gmail.com>
pkgname=adobe-digital-editions
_version=4.0.3
pkgver=${_version}
pkgrel=3
pkgdesc="Adobe's ebook reader able to read publications protected by DRM"
url="http://www.adobe.com/br/solutions/ebook/digital-editions/download.html"
arch=(any)
license=('custom:Adobe End User License Agreements (EULAs)')
depends=(wine samba dex)
makedepends=(wine winetricks)
install=${pkgname}.install
_installer=ADE_4.0_Installer.exe
source=("http://download.adobe.com/pub/adobe/digitaleditions/${_installer}")
md5sums=('SKIP')

package() {
    install -Dm644 ${_installer} ${pkgdir}/tmp/${_installer}
    echo "_installer=${_installer}" > ${pkgdir}/tmp/${pkgname}.PKGBUILD
}
