# Maintainer: Grant <grant@fig.io>

pkgname="cicada-bin"
pkgver="0.1.42"
pkgrel="1"
pkgdesc="Write CI/CD Pipelines in TypeScript"
arch=("x86_64")
url="https://cicada.build"
license=("MIT")
depends=("docker" "deno" "buildkit")
provides=("cicada")
conflicts=("cicada")
source=("$pkgname-$pkgver.tgz::https://github.com/cicadahq/cicada/releases/download/v${pkgver}/cicada-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('5f0c76855259e2c0b5668a62469e25817f011484fc7ed78f1115d0ff82c1d968')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 cicada "$pkgdir/usr/bin"
    install LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
