# Maintainer: walldmtd <walldmtd at proton dot me>

pkgname=vimix-kanagawa-cursors
pkgver=2.1.0
pkgrel=1
pkgdesc="XCursor theme using Kanagawa colours, based on Vimix cursors"
arch=(any)
url="https://github.com/walldmtd/vimix-kanagawa-cursors"
license=("GPL-3.0-or-later")
source=("${pkgname}-wave-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-wave.tar.gz"
        "${pkgname}-lotus-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-lotus.tar.gz")
b2sums=('1dce79cc1e0135fb7572786d4d15491df6da25235ad233cc7a764d580b29aaec3bf3af28511ec81640c07828066399935b524fce57d2b5e68fc58c5e744ca5a4'
        'fecf5d812b5b55c35524293951987695332d69aef60cd9e984002b938aa4c7e65a3e40e6b7472f405673dd22f55af23766134d7208120043af0c8c3d54ea4699')

package() {
    install -d "${pkgdir}"/usr/share/icons/{"${pkgname}-wave","${pkgname}-lotus"}
    cp -dr --no-preserve=ownership "${pkgname}-wave"/* "${pkgdir}/usr/share/icons/${pkgname}-wave"
    cp -dr --no-preserve=ownership "${pkgname}-lotus"/* "${pkgdir}/usr/share/icons/${pkgname}-lotus"
}
