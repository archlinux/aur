pkgname=clash-nyanpasu-bin
_pkgname=clash-nyanpasu
pkgver=1.4.0
pkgrel=0
pkgdesc="A Clash GUI based on tauri. Only for Clash Meta."
arch=('x86_64')
url="https://github.com/keiko233/clash-nyanpasu"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash-meta')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-appimage')
provides=('clash-nyanpasu')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/keiko233/clash-nyanpasu/releases/download/v${pkgver}/clash-nyanpasu_${pkgver}_amd64.deb")
sha256sums=('fcfcf5fcdeccf90116a2b4fdec7ae089b7adef9023231acd440da2b3a2bc99c8')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
    rm ${pkgdir}/usr/bin/clash-meta
}
