# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Dak <dak.linux at gmail dot com>

pkgname=freealchemist
pkgver=0.7
pkgrel=3
pkgdesc="A simple arcade game"
arch=('any')
url="http://dakblog.wordpress.com/freealchemist/"
license=('GPL-2.0-or-later')
depends=('python' 'python-importlib-metadata' 'python-pygame' 'python-setuptools')
source=("https://github.com/dakk/FreeAlchemist/archive/44e7173219c30de3676110dc6ce5beea9e03cc33.zip") # untagged 0.7
md5sums=('9a142c3464d857d6f246d1d898743816')

package(){
    cd FreeAlchemist-44e7173219c30de3676110dc6ce5beea9e03cc33
    sed -e 's/==/>=/g' -i requirements.txt
    python setup.py install --root="$pkgdir"/
}
