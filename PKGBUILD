# Maintainer: Ayad Seghiri <seghiri.ayad@univ-khenchela.dz>

pkgname=volumeboost
pkgver=1.0.0
pkgrel=1
pkgdesc="A volume booster GUI using CustomTkinter"
arch=('x86_64')
keywords=('volume' 'booster' 'audio' 'sound' 'customtkinter' 'gui' 'pulseaudio' 'pavucontrol' 'gnome' 'archlinux' 'tkinter' 'linux' 'sound-enhancer')
url="https://github.com/ayadseghairi/volumeboost"
license=('MIT')
depends=('pavucontrol')
source=("https://github.com/ayadseghairi/volumeboost/releases/download/$pkgver/volumeboost"
	"https://github.com/ayadseghairi/volumeboost/raw/main/volumeboost.png"
	"https://github.com/ayadseghairi/volumeboost/raw/main/volumeboost.desktop"
        "https://github.com/ayadseghairi/volumeboost/raw/main/README.md")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 volumeboost "$pkgdir/usr/bin/volumeboost"
    install -Dm644 volumeboost.png "$pkgdir/usr/share/pixmaps/volumeboost.png"
    install -Dm644 volumeboost.desktop "$pkgdir/usr/share/applications/volumeboost.desktop"
    install -Dm644 README.md "$pkgdir/usr/share/doc/volumeboost/README.md"
}
