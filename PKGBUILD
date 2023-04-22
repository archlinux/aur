# Maintainer: Grant <grant@fig.io>

pkgname="cicada-bin"
pkgver="0.1.41"
pkgrel="1"
pkgdesc="Write CI/CD Pipelines in TypeScript"
arch=("x86_64")
url="https://cicada.build"
license=("MIT" "Apache")
depends=()
provides=("cicada")
conflicts=("cicada")
source=("$pkgname-$pkgver.tgz::https://github.com/cicadahq/cicada/releases/download/v${pkgver}/cicada-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('f0d33621982ce032c59800deec3a24ad5df5d1cb9f21ab32a4a6143c224e23ed')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 cicada "$pkgdir/usr/bin"
}
