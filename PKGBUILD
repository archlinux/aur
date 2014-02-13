_pkgname=moviepy
pkgname=python2-${_pkgname}
pkgver=0.2.1.6.93
pkgrel=1
pkgdesc="Script-based movie editing with python2"
arch=('any')
url="http://zulko.github.io/moviepy/"
license=("MIT")
makedepends=('python2-setuptools')
depends=('ffmpeg' 'imagemagick' 'opencv'
	 'python2-decorator' 'python2-numpy' 'python2-pillow' 'python2-pygame'
	 'scikit-image' 'python2-scipy' 'python-tqdm')
provides=('python2-moviepy-git')
conflicts=('python2-moviepy-git')
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('78c56352ec5bddf5d60dc78b05a9be22bd25e2ab9cef24e0b40b1c4e986faa7b')

package() {
	 cd "${srcdir}/${_pkgname}-${pkgver}"
	 python2 setup.py install --root="${pkgdir}" --optimize=1
}
