# Maintainer: Alexandre Magno <alexandre.mbm@gmail.com>
pkgname=adobe-digital-editions
_version=4.0.3
_build=110333
pkgver=${_version}.${_build}
pkgrel=1
pkgdesc="Adobe's ebook reader able to read publications protected by DRM"
url="http://www.adobe.com/br/solutions/ebook/digital-editions/download.html"
arch=(any)
license=('custom:Adobe End User License Agreements (EULAs)')
depends=(wine samba)
makedepends=(wine winetricks)
install=${pkgname}.install
_installer=ADE_4.0_Installer.exe
source=("http://download.adobe.com/pub/adobe/digitaleditions/${_installer}")
md5sums=('74c73f7e68df9fff35f0a6d940ff2876')

package() {
    install -Dm644 ${_installer} ${pkgdir}/tmp/${_installer}
    echo "_installer=${_installer}" > ${pkgdir}/tmp/${pkgname}.PKGBUILD
}
