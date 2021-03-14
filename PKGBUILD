# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python2-dnsq
pkgver=1.1.6
pkgrel=1
_libname=dnsq
pkgdesc='DNS Query Tool'
url='https://pypi.python.org/pypi/dnsq'
depends=('python2-expiringdict')
license=('Apache2')
arch=('any')
source=(https://files.pythonhosted.org/packages/cd/e4/b832eb7975b61df65e6f5a1487643d037c239ad295b0032830006a0434a6/dnsq-${pkgver}.tar.gz)

build() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py install --root="$pkgdir"
}

sha256sums=('4283025ceb6e557d27c3d61c92e221f32744bbe7c65ec2792e067a06b211e6c2')
