pkgname=clash-nyanpasu-nightly-bin
_pkgname=clash-nyanpasu
pkgver=2.0.0_alpha+fe57083
_pkgver=2.0.0-alpha+fe57083
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
sha256sums=('c18cca2d98d1411dee4e71a83f0d22f86aee1c0bf0c1157d94fae3768b0c52a6')

package() {
  tar xpf data.tar.gz -C ${pkgdir}
}
