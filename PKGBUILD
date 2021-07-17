# Maintainer: u0_a266 <cagf2emv@anonaddy.me>
pkgname=ttf-firge
pkgver=0.1.0
pkgrel=2
pkgdesc="Firge, a programming font that is a combination of Fira Mono and Genshin Gothic. "
arch=("any")
url="https://github.com/yuru7/Firge"
license=('custom:SIL')
source=("$url/releases/download/v$pkgver/Firge_v$pkgver.zip")

sha256sums=('d94ef9db6016d9dbf043b03ab45f36dd266ca930063294f464976fc09fa99489')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 Firge_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
}
