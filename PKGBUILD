# Contributor: c114514 <cnmdwdnmdcmmp@gmail.com>

pkgname=clash-nyanpasu-nightly-bin
_pkgname=clash-nyanpasu
pkgver=2.0.0
pkgrel=1
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆"
arch=('x86_64')
url="https://github.com/LibNyanpasu/clash-nyanpasu"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-bin" "$_pkgname-appimage")
options=(!strip)

source_x86_64=("${_pkgname}-${pkgver}-alpha+20b8bfe-x86_64.deb::${url}/releases/download/pre-release/Clash.Nyanpasu_${pkgver}-alpha+20b8bfe_amd64.deb")

sha512sums_x86_64=('SKIP')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
