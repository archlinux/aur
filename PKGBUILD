# Maintainer: u0_a266 <cagf2emv@anonaddy.me>
pkgname=ttf-firge
pkgver=0.0.2
pkgrel=1
pkgdesc="Firge, a programming font that is a combination of Fira Mono and Genshin Gothic. "
arch=("any")
url="https://github.com/yuru7/Firge"
license=('custom:SIL')
source=("$url/releases/download/v$pkgver/Firge_v$pkgver.zip")

sha256sums=('136c4b32aa862db3b6963dfdf73fb56a3aa70fe6fa37b1d304349ee3cef3d2a1')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 Firge_v0.0.2/*.ttf $pkgdir/usr/share/fonts/TTF
}
