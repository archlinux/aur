# Maintainer: Dmitry Bogdanov <highjackyt@gmail.com>
pkgname=findnumgame
pkgver=1.0.0
pkgrel=1
pkgdesc="Игра на интуицию и визуальынй рассчет пространства на заданной линии"
arch=('any')
url="https://github.com/jezzofficial/FindNumGame.git"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-gobject'
    'gtk3'
    'python-cairo'
    'glib2'
    'hicolor-icon-theme'
)
makedepends=()
source=(
    "https://raw.githubusercontent.com/jezzofficial/FindNumGame/main/findnumgame.py"
    "https://raw.githubusercontent.com/jezzofficial/FindNumGame/main/findnumgame.desktop"
    "https://raw.githubusercontent.com/jezzofficial/FindNumGame/main/findnumgame-icon.png"
)
sha256sums=('9c6a3f2bb946256614693916812118399a81d33ad0e2ebdcb2f656f72a7846e2'
            'fbe3af6162823e93c8d65f225333af2e16a8aedd8746b298d02c42a6a49e040a'
            '91b56b661d31e8a776c11dfd2de1d52a452caf79b5278f1731b444cf17f04d7f')

package() {
    install -Dm755 "$srcdir/findnumgame.py" "$pkgdir/usr/bin/findnumgame"
    install -Dm644 "$srcdir/findnumgame.desktop" "$pkgdir/usr/share/applications/findnumgame.desktop"
    install -Dm644 "$srcdir/findnumgame-icon.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/findnumgame.png"
}


