# Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor solopasha <daron439 at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010@ya.ru>

_pkgname=kotatogram-desktop-beta
pkgname="${_pkgname}-dynamic-bin"
pkgver=1.4.6
pkgrel=2
_pkgrel=2
pkgdesc="Kotatogram – experimental Telegram Desktop fork - Beta version precompiled package"
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
source=("https://github.com/3JlOy-PYCCKUi/kotatogram-desktop-betaAUR/releases/download/k${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst")
b2sums=('a48f50db41aa728bd93fa7570e16df0cd1b5c28a9e001c40b50e29eae7612f43e90fcdcff6bedb1bdc90ae42471246d7e31c7d9178dee960a99391d498b1dbf7')
package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude=".*"
}
