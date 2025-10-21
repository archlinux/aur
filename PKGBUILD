# Maintainer: Matar <khaledmatar19733@gmail.com>
pkgname=gitfetch-python
pkgver=1.1.7
pkgrel=1
pkgdesc="A neofetch-style CLI tool for GitHub statistics"
arch=('any')
url="https://github.com/Matars/gitfetch"
license=('GPL-2.0')
depends=("python-requests" "python-readchar")
makedepends=("python-requests" "python-readchar" "python-pip")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matars/gitfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6ae1b2977f459a15352375f46cd56133eec4c37812b71448528a44f43b77f1f6')

package() {
    cd "gitfetch-$pkgver"
    python -m pip install --root="$pkgdir" --no-deps --no-warn-script-location .
}