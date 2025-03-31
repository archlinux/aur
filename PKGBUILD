# Maintainer: walldmtd <walldmtd at proton dot me>

pkgname=vimix-kanagawa-hyprcursors
pkgver=2.1.0
pkgrel=1
pkgdesc="Hyprcursor theme using Kanagawa colours, based on Vimix cursors"
arch=(any)
url="https://github.com/walldmtd/vimix-kanagawa-cursors"
license=("GPL-3.0-or-later")
source=("${pkgname}-wave-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-wave.tar.gz"
        "${pkgname}-lotus-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-lotus.tar.gz")
b2sums=('4e97cff29a5bc8cc2e4a39928ad1a7c8a908a6e60d97dfb3819019ca0196c74ee27b01d24306cdfeac78ecde3964670f3b174f20b475d82297b25945ba3d4a6c'
        'e50c0a8f09e11b110403158819da0947701db7ad7f551d81bfa05daaae67890660ca4a21c3ce10482cdb6c1e9a6a5add95699ed31c0f5f2fc7d8c116e6fb9ce5')

package() {
    install -d "${pkgdir}"/usr/share/icons/{"${pkgname}-wave","${pkgname}-lotus"}
    cp -r --no-preserve=ownership "${pkgname}-wave"/* "${pkgdir}/usr/share/icons/${pkgname}-wave"
    cp -r --no-preserve=ownership "${pkgname}-lotus"/* "${pkgdir}/usr/share/icons/${pkgname}-lotus"
}
