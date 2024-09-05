# Maintainer : Myt1 <MYT1 @ QQ.com>
pkgname=yolx-bin
pkgver=0.3.9+1
pkgrel=1
pkgdesc="A modern download tool developed with Flutter, powered by 'Aria 2' at its core. "
_pkgname=yolx
pkgname="yolx-bin"
arch=('x86_64')
url="https://github.com/uiYzzi/Yolx"
license=('GPL')
depends=('fuse2fs' 'libayatana-appindicator' 'libayatana-indicator')
provides=("$pkgname")
options=(!strip)
source=("https://github.com/uiYzzi/Yolx/releases/download/${pkgver}/yolx-linux-${pkgver}.deb")
sha512sums=('563b28d6d7c3273e6d2f9ce5ebb60e261f4832efccc4d89dfa75007803e3fb639f7210bd52c80ab8dccb0748346a7e3dd5d82df0e6c9c9a5883dddf13c24f6f7')


package(){
    cd "${srcdir}"
    tar -xvf data.tar.xz -C "${pkgdir}"
    local desktopfile="${pkgdir}/usr/share/applications/qqmusic.desktop"
    install -m755 -d "${pkgdir}/usr/bin"
    ln -s /usr/share/yolx/yolx "${pkgdir}/usr/bin/yolx"
}
