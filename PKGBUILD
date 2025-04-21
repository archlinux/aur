# Maintainer: walldmtd <walldmtd at proton dot me>

pkgname=vimix-kanagawa-hyprcursors
pkgver=2.2.0
pkgrel=1
pkgdesc="Hyprcursor theme using Kanagawa colours, based on Vimix cursors"
arch=(any)
url="https://github.com/walldmtd/vimix-kanagawa-cursors"
license=("GPL-3.0-or-later")
source=("${pkgname}-wave-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-wave.tar.gz"
        "${pkgname}-lotus-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-lotus.tar.gz")
b2sums=('abec1642a734dd5202a4c9b0feddf1146242ef5515391d3ed5753e976ddd6361b88bbd46a2d3b5bfc1131067a4c1398ae6b09a8404d7f6f77e638a3b19158707'
        '90c2330c3595b5d7dd3b159214fc089328e1db3ba07f6c00a24c8fb99b683a8cb97364c9e4e393578b9897418ec2ac5b3325691996b364abd77f436535436277')

package() {
    install -d "${pkgdir}"/usr/share/icons/{"${pkgname}-wave","${pkgname}-lotus"}
    cp -r --no-preserve=ownership "${pkgname}-wave"/* "${pkgdir}/usr/share/icons/${pkgname}-wave"
    cp -r --no-preserve=ownership "${pkgname}-lotus"/* "${pkgdir}/usr/share/icons/${pkgname}-lotus"
}
