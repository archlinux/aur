# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=python-dulwich
pkgver=0.16.1
pkgrel=1
pkgdesc='Pure-Python implementation of the Git file formats and protocols'
arch=('i686' 'x86_64')
url='https://www.dulwich.io/'
license=('GPL2')
depends=('python')
source=("https://www.dulwich.io/releases/dulwich-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ
sha256sums=('470d0feec9d4e7aba091c02f62db7f9cc6549ffe3f623a8039f96f584159da05'
            'SKIP')
sha384sums=('1f9efcb70aac84aeafaf1c6670af3510b86921f4d09f71b8b729a780e56e90dd17d319fdc002a7aad1ead0074c993882'
            'SKIP')

package() {
  cd "dulwich-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
