# Contributor: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Dak <dak.linux at gmail dot com>

pkgname=freealchemist
pkgver=0.7
pkgrel=1
pkgdesc="A figure block game written in Python where you have to connect blocks"
arch=('any')
url="http://dakblog.wordpress.com/freealchemist/"
license=('GPL')
depends=('python-pygame')
makedepends=('python-setuptools')
source=("https://github.com/dakk/FreeAlchemist/archive/44e7173219c30de3676110dc6ce5beea9e03cc33.zip") # untagged 0.7
md5sums=('9a142c3464d857d6f246d1d898743816')

package(){
    cd FreeAlchemist-44e7173219c30de3676110dc6ce5beea9e03cc33
    sed -e 's/==/>=/g' -i requirements.txt
    python setup.py install --root="$pkgdir"/
}
