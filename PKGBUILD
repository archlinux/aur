# Mantenedor: Bruno do Nascimento <eusouobn@gmail.com>
pkgname=niri-tearing-git-bin
pkgver=26.04.r94.g209fe152
pkgrel=1
pkgdesc="Scrollable-tiling Wayland compositor (tearing fork) - versão binária pré-compilada"
arch=('x86_64')
url="https://github.com/urayde/niri"
license=('GPL-3.0-or-later')
depends=(cairo glib2 libdisplay-info libinput libpipewire libxkbcommon mesa pango pixman seatd)
provides=('niri')
conflicts=('niri' 'niri-git' 'niri-tearing-git')

# Link sem o 'v' porque sua tag não tem
source=("https://github.com/eusouobn/niri-tearing-bin-releases/releases/download/${pkgver}/niri-full-${pkgver}-x86_64.tar.gz")
sha256sums=('1f06b82d338914218375284dce37ca77c3e789fa7230ac8a16464b7c5eed6ecf')

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
