# Maintainer: walldmtd <walldmtd at proton dot me>

pkgname=vimix-kanagawa-hyprcursors
pkgver=2.0.0
pkgrel=1
pkgdesc="Hyprcursor theme using Kanagawa colours, based on Vimix cursors"
arch=(any)
url="https://github.com/walldmtd/vimix-kanagawa-cursors"
license=("GPL-3.0-or-later")
source=("${pkgname}-wave-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-wave.tar.gz"
        "${pkgname}-lotus-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-lotus.tar.gz")
b2sums=('de27200e40581c82b9220267b32aeb5c78570e0c20432ae018b95093c57aca1e77c3d80e3fc831dd90e950fde3a03f9b2231e924670c9d371d4962d141dabf58'
        '6820801d2ca8afca97382be07fe682fce2460b892bf66ef8a5f260cf0ec9227bbe9b82db04177044c601364ab97e8dbee1ac2f5d1cc91f0ef31b7a7e80a1d577')

package() {
    install -d "${pkgdir}"/usr/share/icons/{"${pkgname}-wave","${pkgname}-lotus"}
    cp -r --no-preserve=ownership "${pkgname}-wave"/* "${pkgdir}/usr/share/icons/${pkgname}-wave"
    cp -r --no-preserve=ownership "${pkgname}-lotus"/* "${pkgdir}/usr/share/icons/${pkgname}-lotus"
}
