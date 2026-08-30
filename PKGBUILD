# Maintainer: Bruno do Nascimento <eusouobn@gmail.com>
pkgname=noctalia-git-bin
pkgver=5.0.0.r5326.g67addbd52
pkgrel=1
pkgdesc="Noctalia - um tema/ambiente para Wayland (versão binária pré-compilada)"
arch=('x86_64')
url="https://github.com/Noctalia-Project/noctalia"
license=('GPL-3.0-or-later')
depends=('bash' 'python' 'python-pip' 'python-gobject' 'gtk3' 'cairo' 'pango' 'gdk-pixbuf2' 'librsvg' 'sdbus-cpp' 'libqalculate' 'libical' 'tomlplusplus' 'jemalloc')
provides=('noctalia')
conflicts=('noctalia' 'noctalia-git' 'noctalia-bin')
options=(!debug)

source=("https://github.com/eusouobn/noctalia-bin-releases/releases/download/v${pkgver}/noctalia-full-${pkgver}-x86_64.tar.gz")
sha256sums=('d398426c6fb1cf11b04d7a5d3b2950637c9663a687c38b4e1fe713e94574234b')

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
