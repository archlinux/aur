# Maintainer: Voronwe Sul <Voronwe.S@protonmail.com>
# Contributor: Voronwe Sul <Voronwe.S@protonmail.com>

pkgname="gikkon"
pkgver="0.1.0"
pkgrel=1
pkgdesc="Backup tool for configs, which uses git as storage"
arch=("any")
url="https://github.com/bronvic/$pkgname"
license=("MIT")
depends=("python>=3.7.0" "python-pip" "sudo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("SKIP")

build() {
    make --directory="$srcdir/$pkgname-$pkgver" build
}

package() {
    make --directory="$srcdir/$pkgname-$pkgver" install
}
