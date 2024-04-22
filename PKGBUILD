pkgname=soh-bin
pkgver=8.0.5
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="Ship of Harkinian Reimplimentation engine"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/soh-bin"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip')
makedepends=('unzip')
sha256sums_x86_64=('1e955bae9318587729a45eb78decd502d9ead986e81eddbf7643d4101e922e6d')
sha256sums_aarch64=('fc518ae80c00d48e9fd4e971a3b93984708eb6c441479a85c4d3ea627ec74b54')
source_x86_64=("https://gitlab.com/linuxbombay/soh-bin/binaries/$pkgver/-/raw/main/soh-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/soh-bin/binaries/$pkgver/-/raw/main/soh-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    mv "$srcdir/soh" "$pkgdir/usr/bin"
}
