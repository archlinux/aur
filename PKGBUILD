pkgname=clash-nyanpasu-bin
_pkgname=clash-nyanpasu
pkgver=1.3.7
pkgrel=0
pkgdesc="A Clash GUI based on tauri. Only for Clash Meta."
arch=('x86_64')
url="https://github.com/keiko233/clash-nyanpasu"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash-meta')
optdepends=('clash-meta: Another Clash Kernel')
conflicts=('clash-nyanpasu-git')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/keiko233/clash-nyanpasu/releases/download/dev/clash-nyanpasu_${pkgver}_amd64.deb")

sha256sums=('2f1b2bb433675fab8a4eee1e2df5b5dd76a7c1f2d72658cbc8b15257627ecb5e')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
    rm ${pkgdir}/usr/bin/clash-meta
}
