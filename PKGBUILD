# Maintainer: FishHawk <whang177@gmail.com>

pkgname=memo
_pkgname=memo
pkgver=v0.1.1
pkgrel=1
pkgdesc="A drop-down app to take note for KDE users"
arch=('x86_64')
url="https://github.com/FishHawk/Memo"
license=('GPL')
depends=('qt5-quickcontrols2' 'kxmlgui')
source=("https://github.com/FishHawk/Memo/releases/download/$pkgver/memo-linux-x64-$pkgver.tar.gz")
md5sums=('SKIP')

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications/"
    
    install -m755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -m644 "${srcdir}/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
 
