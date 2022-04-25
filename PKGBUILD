# Maintainer: brodokk <brodokk at brodokk dot space>

_pkgname=flake8-bandit
pkgname=python-$_pkgname

pkgver=3.0.0
pkgrel=1
pkgdesc="Automated security testing using bandit and flake8."

url='https://github.com/tylerwince/flake8-bandit'
arch=('any')
license=('MIT')

depends=('python' 'bandit')

source=("https://github.com/tylerwince/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c60054dd869cb4b756cfa33a89630915a36c324f8b93b639c840d0ef9fda523af259d4bda3ba39fcc1317291b70293d727bebe845b55f1c3650ffe093afd6b0e')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

