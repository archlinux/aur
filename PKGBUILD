# Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor solopasha <daron439 at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010@ya.ru>

pkgname=kotatogram-desktop-dynamic-bin
_pkgname=kotatogram-desktop
pkgver=1.4.8
pkgrel=2
_pkgrel=2
pkgdesc="Kotatogram – experimental Telegram Desktop fork - Stable version, precompiled package"
arch=('x86_64')
url="https://kotatogram.github.io"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland' 'libdbusmenu-qt5' 'xxhash' 'kwayland' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'jemalloc' 'libxrandr' 'abseil-cpp' 'libjpeg-turbo' 'opus' 'openssl' 'libx11' 'libvpx' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'zlib' 'wayland'  'glibc' 'libsigc++' 'glib2' 'xcb-util-keysyms' 'libxcb' 'gcc-libs')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
conflicts=('kotatogram-desktop' 'kotatogram-desktop-bin')
provides=('kotatogram-desktop')
source=("https://github.com/3JlOy-PYCCKUi/kotatogramAUR/releases/download/k${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst")
b2sums=('40a039f40c7935f9aee1cac01d3893bcac6a106d891bb890758a7f4110ec0b5b960faf75c66be645460fb84cb362feb46e2faefcd14cdad7167547f1da060d5a')
package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude=".*"
}
