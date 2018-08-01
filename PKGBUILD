_pkgname=moviepy
pkgname=python-${_pkgname}
pkgver=0.2.3.5
pkgrel=1
pkgdesc="Script-based movie editing with python"
arch=('any')
url="http://zulko.github.io/moviepy/"
license=("MIT")
makedepends=('python-setuptools')
depends=('ffmpeg' 'imagemagick' 'opencv'
	 'python-decorator' 'python-numpy' 'python-pillow' 'python-scikit-image' 'python-scipy' 'python-tqdm' 'python-imageio')
optdepens=('python-pygame')
provides=('python-moviepy-git')
conflicts=('python-moviepy-git')
source=(https://github.com/Zulko/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('2c05515f5a3ff4225be192ef560b0328348899a64f566548efe131243eb9eb8d')

package() {
	 cd "${srcdir}/${_pkgname}-${pkgver}"
	 python setup.py install --root="${pkgdir}" --optimize=1
}
