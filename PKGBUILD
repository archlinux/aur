pkgname=clash-nyanpasu-nightly-bin
_pkgname=clash-nyanpasu
pkgver=2.0.0_alpha+8eb983d
_pkgver=2.0.0-alpha+8eb983d
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
sha256sums=('ae507c5a204dd1bb57b47622d41f4d89177e184f8b074927285ff098d499870f')

package() {
  tar xpf data.tar.gz -C ${pkgdir}
}
