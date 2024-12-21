pkgname=porkbun-ddns
pkgver=1.1.9
pkgrel=2
pkgdesc='An unoffical DDNS-Client for Porkbun Domains'
arch=(any)
url=https://github.com/mietzen/porkbun-ddns
license=(MIT)
depends=(python python-xdg-base-dirs)
makedepends=(python-setuptools)
source=("https://github.com/mietzen/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94a4e74d98da543d947714816420f606e6ad5eb0a48cb470fc974d7c3d748bf7')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
