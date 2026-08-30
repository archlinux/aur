# Maintainer: Bruno do Nascimento <eusouobn@gmail.com>
pkgname=noctalia-git-bin
pkgver=5.0.0.r5356.g8d30bf938
pkgrel=1
pkgdesc="Noctalia - um tema/ambiente para Wayland (versão binária pré-compilada)"
arch=('x86_64')
url="https://github.com/Noctalia-Project/noctalia"
license=('GPL-3.0-or-later')
depends=('bash' 'python' 'python-pip' 'python-gobject' 'gtk3' 'cairo' 'pango' 'gdk-pixbuf2' 'librsvg' 'sdbus-cpp' 'libqalculate' 'libical' 'tomlplusplus' 'jemalloc')
provides=('noctalia')
conflicts=('noctalia' 'noctalia-git' 'noctalia-bin')
options=(!debug)

source=("https://github.com/eusouobn/noctalia-bin-releases/releases/download/v5.0.0.r5356.g8d30bf938/noctalia-full-${pkgver}-x86_64.tar.gz")
sha256sums=('4805c3aaa771b2024ed23d1c72e490e0f68bd2d688e4ea006515614a76c55f8c')

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
