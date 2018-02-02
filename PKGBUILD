# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=3.12.1
pkgrel=1
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks. (Formerly Spotmop)'
arch=('any')
url="https://github.com/jaedb/${_pkgname}"
license=('APACHE')
depends=('python2' 'mopidy' 'mopidy-spotify' 'python2-configobj'
         'mopidy-local-images' 'python2-pylast' 'python2-raven')
makedepends=('python2' 'python2-setuptools' 'python2-pip')
optdepends=('mopidy-local-sqlite: local library support')
source=("https://files.pythonhosted.org/packages/source/M/Mopidy-Iris/Mopidy-Iris-${pkgver}.tar.gz")
sha256sums=('1dda7f845a5e21b7680c93af523c30103e862cf6b3232ba4ecb7d0d265608b16')

package() {
  cd "${srcdir}/Mopidy-Iris-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
