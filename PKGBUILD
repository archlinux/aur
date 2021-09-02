# Maintainer: Takumi <takuoh@tutanota.com>
pkgname=ttf-firge
pkgver=0.1.0
pkgrel=3
pkgdesc="Firge, a programming font that is a combination of Fira Mono and Genshin Gothic. "
arch=("any")
url="https://github.com/yuru7/Firge"
license=('custom:SIL')
source=("$url/releases/download/v$pkgver/Firge_v$pkgver.zip"
        "$url/releases/download/v$pkgver/FirgeNerd_v$pkgver.zip")

sha256sums=('d94ef9db6016d9dbf043b03ab45f36dd266ca930063294f464976fc09fa99489'
            '239048c643207db4912e248d7fd3aaab948f9be78756b0f59e23cd93eab436f6')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 Firge_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 FirgeNerd_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
}
