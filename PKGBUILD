pkgname=clash-nyanpasu-nightly-bin
_pkgname=clash-nyanpasu
pkgver=2.0.0_alpha+f7ee292
_pkgver=2.0.0-alpha+f7ee292
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
sha256sums=('f91644294ec1576ab9382bb02a1d9b5ed76516c5156aa7accdaf5518e75bab98')

package() {
  tar xpf data.tar.gz -C ${pkgdir}
}
