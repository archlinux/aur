pkgname=vsironbar-studio
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Visual configuration editor for Ironbar - the modern Wayland status bar"
arch=('x86_64')
url="https://github.com/anomalyco/vsIronbar-Studio"
license=('MIT')
groups=()
depends=(
    'python>=3.10'
    'python-gobject'
    'gtk3'
    'webkit2gtk'
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/anomalyco/vsIronbar-Studio/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
validpgpkeys=()
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 vsironbar-studio "$pkgdir/usr/bin/vsironbar-studio"
    install -Dm644 vsironbar-studio.desktop "$pkgdir/usr/share/applications/vsironbar-studio.desktop"
    install -Dm644 vsironbar-studio.png "$pkgdir/usr/share/pixmaps/vsironbar-studio.png"
    
    mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    cp vsironbar-studio.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/vsironbar-studio.png"
    
    mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    cp vsironbar-studio.png "$pkgdir/usr/share/icons/hicolor/scalable/apps/vsironbar-studio.png"
}
