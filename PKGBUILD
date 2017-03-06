# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=python-dulwich
pkgver=0.17.1
pkgrel=1
pkgdesc='Pure-Python implementation of the Git file formats and protocols'
arch=('i686' 'x86_64')
url='https://www.dulwich.io/'
license=('GPL2')
depends=('python')
source=("https://www.dulwich.io/releases/dulwich-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ
sha256sums=('5d61812a810038b260ee88807fdb39b4d827e2f00fe5907dad22d2733008f3ea'
            'SKIP')
sha384sums=('aa962c5d1a004d2b1db665214da37a8aa47a419599780ad4ceb8f60d239c9e2e2946f7259b9b74d571f4508747ca83e4'
            'SKIP')

package() {
  cd "dulwich-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
