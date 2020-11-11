# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-assertive
pkgname=python-$_pkgname

pkgver=1.3.0
pkgrel=1
pkgdesc="Flake8 unittest assert method checker"

url='https://github.com/jparise/flake8-assertive'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/jparise/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('7d931f9e8167ab177b380f87c625df1a4bd3a64a74e060ce27854d689cbda27a1b7d3f836331c6c8806abbf788e421775fa0e18d80dc6ac7b1cc20597c45e2da')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

