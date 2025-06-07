pkgname=clash-nyanpasu-bin
_pkgname=clash-nyanpasu
pkgver=1.6.1
pkgrel=3
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​"
arch=('x86_64')
url="https://github.com/LibNyanpasu/clash-nyanpasu"
license=('GPL3')
options=('!strip' '!debug')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'mihomo')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-appimage' 'clash-nyanpasu')
provides=('clash-nyanpasu')
optdepends=('clash-rs: custom protocol network proxy, coding with rust')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/LibNyanpasu/clash-nyanpasu/releases/download/v${pkgver}/clash-nyanpasu_${pkgver}_amd64.deb")
sha256sums=('d7dd4c86aede61060da983be6b81b5b1047fea11bc59c1702e7e4011d371d23e')

package() {
  tar xpf data.tar.gz -C ${pkgdir}
  rm ${pkgdir}/usr/bin/clash
  rm ${pkgdir}/usr/bin/mihomo
  rm ${pkgdir}/usr/bin/clash-rs
  rm ${pkgdir}/usr/bin/mihomo-alpha
  # thanks https://aur.archlinux.org/clash-meta-is-mihomo.git

}
