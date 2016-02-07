# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=mopidy-spotify-tunigo
pkgver=1.0.0
pkgrel=1
pkgdesc="Mopidy extension for providing the browse feature of Spotify"
arch=('any')
url="https://github.com/trygveaa/mopidy-spotify-tunigo"
license=('APACHE')
depends=('python2' 'mopidy>=0.19' 'python2-pykka>=1.1' 'mopidy-spotify>=1.2' 'python2-tunigo>=1.0.0')
makedepends=('python2' 'python2-setuptools')
source=("https://github.com/trygveaa/mopidy-spotify-tunigo/archive/v${pkgver}.tar.gz")
md5sums=('49d2b3c5301efe7d9cf147fccb63380d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
