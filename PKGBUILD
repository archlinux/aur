# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=null
pkgrel=0
pkgdesc="Clash Meta GUI based on tauri."
arch=('x86_64')
url="https://github.com/wonfen/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash-meta')
conflicts=("$_pkgname" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git")
source=("${_pkgname}-${pkgver}-${arch}.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('b5de29d121e14dbebe859b6095a69b734675dbab7acf9623eac0d5d43517a22ac0cc1fcb4e743ca71a5e110df63c8631b068e1992012acc2f315b33647d576ad')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash-meta

    chown -R root:root ${pkgdir}
}