# Maintainer: Larry Oates <your email at domain dot tld>
pkgname=doomfire-wallpaper-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Animated doom fire effect wallpaper for Wayland compositors'
arch=('x86_64')
url='https://github.com/larry-oates/doomfire-wallpaper'
license=('GPL3')
depends=('gtk4' 'gtk4-layer-shell' 'wayland')
optdepends=('grim: for the screen_burn feature')
provides=('doomfire-wallpaper')
conflicts=('doomfire-wallpaper')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/doomfire-wallpaper-v${pkgver}-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 doomfire-wallpaper "$pkgdir/usr/bin/doomfire-wallpaper"
}
