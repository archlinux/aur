# Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor solopasha <daron439 at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010@ya.ru>

_pkgname=kotatogram-desktop-beta
pkgname="${_pkgname}-dynamic-bin"
pkgver=1.4.9
pkgrel=2
_pkgrel=2
pkgdesc="Kotatogram – experimental Telegram Desktop fork - Beta version precompiled package"
arch=('x86_64')
url="https://kotatogram.github.io"
license=('GPL3')
depends=('hunspell' 'ffmpeg4.4' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat' 'xxhash' 'kwayland' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'jemalloc' 'libxrandr' 'abseil-cpp' 'libjpeg-turbo' 'opus' 'openssl' 'libx11' 'libvpx' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'zlib' 'wayland'  'glibc' 'libsigc++' 'glib2' 'xcb-util-keysyms' 'libxcb' 'gcc-libs' 'libdispatch')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
conflicts=('kotatogram-desktop' 'kotatogram-desktop-bin')
provides=('kotatogram-desktop')
source=("https://github.com/3JlOy-PYCCKUi/kotatogram-desktop-betaAUR/releases/download/k${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst")
package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude=".*"
}
b2sums=('c45641597b36e71291c1320f5e0f3f31c7a27817e33adfee0c34d7e7b685697b2e1d604f9ad37923260e4d7297dd0ad5e3765817db24330c2f1fc04bb25442f2')
