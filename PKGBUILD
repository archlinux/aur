# Maintainer: Eragon <eragon at eragon dot re>

_pipname=flask-crontab
pkgname=python-flask-crontab
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple Flask scheduled tasks without extra daemons"
arch=('any')
url="https://github.com/frostming/flask-crontab"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-flask')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('ec38074d7b5237df31b406576e9ccc79c924d8363dcba4e857830c4ec63a1185')

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

