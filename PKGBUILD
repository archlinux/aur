# Maintainer: Muhammad Dhiyaul Atha <mdhyaulatha@gmail.com>
pkgname=netguardify
pkgver=1.0.5
pkgrel=1
pkgdesc="Professional, open-source cybersecurity CLI tool for Linux"
arch=('any')
url="https://github.com/Bangkah/netguardify"
license=('MIT')
depends=('python' 'python-psutil' 'python-colorama' 'python-autopep8')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/n/netguardify/netguardify-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/netguardify-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
