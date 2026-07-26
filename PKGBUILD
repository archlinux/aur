pkgname=redemption-bin
pkgver=1.1
pkgrel=1
pkgdesc="Recursive Directory Music Player"
arch=('x86_64')
url="https://github.com/CT-66/Redemption"
license=('GPL-3.0-only')

depends=(
    qt6-base
    mpv
    taglib
)

provides=('redemption')
conflicts=('redemption' 'redemption-git')

source=(
    "Redemption::https://github.com/CT-66/Redemption/releases/download/v1.1/Redemption"
    "Redemption.desktop::https://raw.githubusercontent.com/CT-66/Redemption/refs/heads/master/Redemption.desktop"
    "redemption.svg::https://raw.githubusercontent.com/CT-66/Redemption/refs/heads/master/redemption.svg"
)
sha256sums=(
    'cd697b95679f40e4fbf1c36a9ae5e2f688cd7394de9f39f994ae752ce1a9f04c'
    '917bd28fe98da01fbce81b2d151a288d130b6050d2a5323301f7aa131cfce1ba'
    '6e30a42ac6a17967cf585a75978897274c65899bb0575ef43249607e443a320b'
)

package() {
    install -Dm755 "$srcdir/Redemption" "$pkgdir/usr/bin/Redemption"
    install -Dm644 "$srcdir/Redemption.desktop" "$pkgdir/usr/share/applications/Redemption.desktop"
    install -Dm644 "$srcdir/redemption.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/redemption.svg"
}
