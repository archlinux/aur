# Maintainer: walldmtd <walldmtd at proton dot me>

pkgname=vimix-kanagawa-cursors
pkgver=2.2.0
pkgrel=1
pkgdesc="XCursor theme using Kanagawa colours, based on Vimix cursors"
arch=(any)
url="https://github.com/walldmtd/vimix-kanagawa-cursors"
license=("GPL-3.0-or-later")
source=("${pkgname}-wave-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-wave.tar.gz"
        "${pkgname}-lotus-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-lotus.tar.gz")
b2sums=('39ab2c47aa305d3540095fe07e15686cf5eac248320a7e0f90113976dbd797c2a4cef31b9704e0089a0cfba8b03d9130aa2493f4158b5f5c8579bc146cba405e'
        'f3e1cfb67ab739360e9a281e46062110ed6b7390490df7b0971358699fa79602319cb414c7d31893fb58510b6bab4a569bff0a7e85df747d67d3aa3a37b40e39')

package() {
    install -d "${pkgdir}"/usr/share/icons/{"${pkgname}-wave","${pkgname}-lotus"}
    cp -dr --no-preserve=ownership "${pkgname}-wave"/* "${pkgdir}/usr/share/icons/${pkgname}-wave"
    cp -dr --no-preserve=ownership "${pkgname}-lotus"/* "${pkgdir}/usr/share/icons/${pkgname}-lotus"
}
