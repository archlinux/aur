# Maintainer: Yardena Cohen <yardenack at gmail dot com>

_pkgname=moviepy
pkgname=python2-${_pkgname}
pkgver=0.2.3.2
pkgrel=1
pkgdesc="Script-based movie editing with python2"
arch=('any')
url="http://zulko.github.io/moviepy/"
license=("MIT")
makedepends=('python2-setuptools')
depends=('ffmpeg' 'imagemagick' 'opencv'
	 'python2-decorator' 'python2-numpy' 'python2-pygame'
	 'python2-scikit-image' 'python2-scipy' 'python2-tqdm')
provides=('python2-moviepy-git')
conflicts=('python2-moviepy-git')
hashish=46/b3/bd19188e23af213a3bcaa10451aaa16e88fe3cc0b8a55f9599d6a2d116bb
source=(https://pypi.python.org/packages/${hashish}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('c733967656fa4be4c37ec48af72b63ab2991455aa862321437a013705797c4ab')

package() {
	 cd "${srcdir}/${_pkgname}-${pkgver}"
	 python2 setup.py install --root="${pkgdir}" --optimize=1
}
