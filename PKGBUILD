# Maintainer: Ayatale <ayatale@qq.com>

pkgname=xstop
pkgver=0.1.1
pkgrel=1
pkgdesc="Just click to pause/resume x11 windows, inspired by xkill."
url="https://github.com/Brx86/Xstop"
arch=("x86_64")
license=("GPL3")
depends=("libnotify" "procps-ng" "python" "xorg-xprop")
provides=("xstop")
source=("xstop" "xstop-pause.png" "xstop-resume.png")
sha256sums=('d62d0629e88d63231611ea125989c3966561a80d40c64d3008a356b6b8c5ec71'
            '0cf450a42f44711e301a86ca6e103ab09492879df27022901d61471a768702b5'
            '265cd2db16a1fa320a79c4c5ee047c8dba8be5d9251620f2697ebc188e8de6d5')

package() {
    install -Dm755 "xstop" -t "$pkgdir/usr/bin"
    install -Dm644 "xstop-pause.png" -t "$pkgdir/usr/share/icons/hicolor/48x48/actions/"
    install -Dm644 "xstop-resume.png" -t "$pkgdir/usr/share/icons/hicolor/48x48/actions/"
}
