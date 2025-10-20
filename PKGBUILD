# Maintainer: Matar <khaledmatar19733@gmail.com>
pkgname=gitfetch-python
pkgver=1.0.20
pkgrel=1
pkgdesc="A neofetch-style CLI tool for GitHub statistics"
arch=('any')
url="https://github.com/Matars/gitfetch"
license=('GPL-2.0')
depends=('python' 'python-pip' 'github-cli')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matars/gitfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5dee1bb3e22ca12c5f712ef0fc8276837f7b70ac25cfab34b6f79bda5cc77b90')

package() {
    cd "gitfetch-$pkgver"
    python -m pip install --root="$pkgdir" --no-deps --no-warn-script-location .
}