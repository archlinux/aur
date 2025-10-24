# Maintainer: Matar <khaledmatar19733@gmail.com>
pkgname=gitfetch-python
pkgver=1.2.3
pkgrel=1
pkgdesc="A neofetch-style CLI tool for GitHub statistics"
arch=('any')
url="https://github.com/Matars/gitfetch"
license=('GPL-2.0')
depends=("python-requests" "python-readchar")
makedepends=("python-requests" "python-readchar" "python-pip")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matars/gitfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83896b1680919890011a5efb5eca00e00afe7e1143066e82a81112d4a0255266')

package() {
    cd "gitfetch-$pkgver"
    python -m pip install --root="$pkgdir" --no-deps --no-warn-script-location .
}