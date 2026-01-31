pkgname=clash-nyanpasu-nightly-bin
_pkgname=clash-nyanpasu
pkgver=2.0.0_alpha+8b74223
_pkgver=2.0.0-alpha+8b74223
pkgrel=1
epoch=1
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​"
arch=('x86_64')
url="https://github.com/LibNyanpasu/clash-nyanpasu"
license=('GPL3')
options=(!strip)
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-appimage' 'clash-nyanpasu' 'clash-nyanpasu-bin')

source=("Clash.Nyanpasu_${_pkgver}_amd64.deb::https://github.com/LibNyanpasu/clash-nyanpasu/releases/download/pre-release/Clash.Nyanpasu_${_pkgver}_amd64.deb")
sha256sums=('8e8f6a13ab897d00e56f101066bfca9ecdea530431686b5485861321339acbdd')

package() {
  tar xpf data.tar.gz -C ${pkgdir}
}
