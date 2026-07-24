# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=linux-wallpaperengine-bin
pkgver=r627.b016d7d
pkgrel=1
pkgdesc="Use Steam's Wallpaper Engine wallpapers on Linux (prebuilt snapshot of main)"
arch=('x86_64')
url="https://github.com/Almamu/linux-wallpaperengine"
license=('GPL-3.0-only')
depends=('lz4' 'ffmpeg' 'mpv' 'glfw' 'glew' 'freeglut' 'libpulse' 'libcups'
         'at-spi2-core' 'nss' 'libxcomposite' 'libxdamage' 'nspr')
provides=('linux-wallpaperengine')
conflicts=('linux-wallpaperengine' 'linux-wallpaperengine-git')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('ed71a7ca046003c368b6af7aa9766dee36cd5da84921a4a34991248d62d7bc6b')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  cp -a "$srcdir/opt" "$pkgdir/"
}
