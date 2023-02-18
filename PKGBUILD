# Maintainer: brodokk <brodokk at brodokk dot space>

_pkgname=flake8-bandit
pkgname=python-$_pkgname

pkgver=4.1.1
pkgrel=1
pkgdesc="Automated security testing using bandit and flake8."

url='https://github.com/tylerwince/flake8-bandit'
arch=('any')
license=('MIT')

depends=('python' 'bandit')

source=("https://github.com/tylerwince/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('7e5f81661f93664aaa5fee79e6eb19c17212f8a70d702d5b9507902411bb131997a27d3f1cd794867755b141596c94961970c094eb039dcb5b6b1fbc35e6bb57')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

