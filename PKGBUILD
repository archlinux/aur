# Maintainer: Matar <khaledmatar19733@gmail.com>
pkgname=gitfetch-python
pkgver=1.2.1
pkgrel=1
pkgdesc="A neofetch-style CLI tool for GitHub statistics"
arch=('any')
url="https://github.com/Matars/gitfetch"
license=('GPL-2.0')
depends=("python-requests" "python-readchar")
makedepends=("python-requests" "python-readchar" "python-pip")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matars/gitfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6fb7537fb15c15c9e6d8456a44ae3efd5b1d1daff2fde4d983ac8e784f2fe437')

package() {
    cd "gitfetch-$pkgver"
    python -m pip install --root="$pkgdir" --no-deps --no-warn-script-location .
}