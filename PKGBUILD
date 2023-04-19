# Maintainer: Grant <grant@fig.io>

pkgname="cicada-bin"
pkgver="0.1.36"
pkgrel="1"
pkgdesc="Write CI/CD Pipelines in TypeScript"
arch=("x86_64")
url="https://cicada.build"
license=("MIT" "Apache")
depends=()
provides=("cicada")
conflicts=("cicada")
source=("$pkgname-$pkgver.tgz::https://github.com/cicadahq/cicada/releases/download/v${pkgver}/cicada-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('d4e85ff672a723b56cce9a1c350035b844d079e8271617e20a1471c0aca12bd2')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 cicada "$pkgdir/usr/bin"
}
