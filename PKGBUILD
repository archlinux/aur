# Maintainer: 
pkgname=stryde
pkgver=0.2.0
pkgrel=1
pkgdesc="Application launcher for Linux written in Rust"
arch=('x86_64')
url="https://github.com/dest-lab/stryde"
license=('MIT')
depends=('libgl' 'libx11' 'libxrandr' 'libxcb')
makedepends=('rust' 'cargo')
provides=('stryde')
conflicts=()
replaces=()
options=(!lto)
source=("https://github.com/dest-lab/stryde/releases/download/v${pkgver}/stryde_${pkgver}_x86_64.tar.gz")
sha512sums=("a76c7462e67f814c033362930f9bc3b3028f60e3234e6b7b1b2390eca9751902cd6cd54b4cd75467e01f9dc5d9372c51ca85361323736fa0e155f9fb650f9724")
package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
