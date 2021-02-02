# Maintainer: sseneca <me at ssene dot ca>
pkgname=html5validator
pkgver=0.3.3
pkgrel=1
pkgdesc="Command line tool to validate HTML5 files."
arch=('any')
url="https://github.com/svenkreiss/html5validator"
license=('MIT')
depends=('python-yaml' 'java-environment-openjdk=8')
makedepends=('python')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('28299180c3ae77f7a1eca731781ad52eab7aed02ae1f3eecf917f5eb9ff891b7e778d5581dfbb06d45527889b8992af478a7d99534eb366a750e80445d708a94')


package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
