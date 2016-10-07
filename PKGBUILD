pkgname=mopidy-spotify-web
_pkgname=Mopidy-Spotify-Web
pkgver=0.3.0
pkgrel=1
pkgdesc='Mopidy extension for providing the browse feature of Spotify for artists and albums'
arch=('any')
url="https://github.com/lfcabend/mopidy-spotify-web"
license=('APACHE')
depends=('python2' 'mopidy>=0.19.0' 'python2-pykka' 'mopidy-spotify>=1.2.0' 'python2-requests' 'python2-spotipy')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

md5sums=('79616cf599911c6a4e89930413c548b9')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}
