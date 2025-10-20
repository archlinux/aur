# Maintainer: Matar <khaledmatar19733@gmail.com>
pkgname=gitfetch-python
pkgver=1.1.0
pkgrel=1
pkgdesc="A neofetch-style CLI tool for GitHub statistics"
arch=('any')
url="https://github.com/Matars/gitfetch"
license=('GPL-2.0')
depends=("python-requests" "python-readchar")
makedepends=("python-requests" "python-readchar")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matars/gitfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

package() {
    cd "gitfetch-$pkgver"
    python -m pip install --root="$pkgdir" --no-deps --no-warn-script-location .
}