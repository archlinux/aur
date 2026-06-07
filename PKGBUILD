# Maintainer: Jakepys Perdomo <j4kyjak3@protonmail.com>
pkgname=genpass
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple but efficient password generator optimized for cryptographic security"
arch=('x86_64')
url="https://github.com/JuanPerdomo00/generador-password"
license=('GPL3')
depends=()
optdepends=(
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('SKIP')

build() {
    cd "generador-password-$pkgver"
    make
}

package() {
    cd "generador-password-$pkgver"
    make install PREFIX="$pkgdir/usr"
}
