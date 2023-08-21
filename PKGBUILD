pkgname='python-youtube-search-python'
pkgver='1.6.6'
pkgrel=1
pkgdesc="Search for YouTube videos, channels & playlists & get video information using link WITHOUT YouTube Data API v3"
url="https://github.com/alexmercerind/youtube-search-python"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/91/3c/dc669b0308e49f294df67bddbb16ff3eefe5b5da6fa37ead922a8301926b/youtube-search-python-${pkgver}.tar.gz")
sha256sums=('4568d1d769ecd7eb4bb8365f04eec6e364c5f70eec7b3765f543daebb135fcf5')

build() {
    cd "${srcdir}/youtube-search-python-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/youtube-search-python-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
