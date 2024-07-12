# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Dak <dak.linux at gmail dot com>

pkgname=freealchemist
pkgver=0.7
pkgrel=5
pkgdesc="A simple arcade game"
arch=('any')
url="https://github.com/dakk/FreeAlchemist/"
license=('GPL-2.0-or-later')
depends=('python' 'python-pygame')
makedepends=('python-setuptools')
source=("https://github.com/dakk/FreeAlchemist/archive/refs/tags/v0.7.tar.gz")
sha256sums=('683081c70b17a19b18771c46b4c3a978ce2090231b712350280c89c7105bb1bc')

package(){
    cd FreeAlchemist-${pkgver}
    sed -e 's/==/>=/g' -i requirements.txt
    python setup.py install --root="${pkgdir}"/
}
