# Maintainer: hauzer <hauzer.nv@gmail.com>

pkgname=scrobbler
_pkgname=scrobblerh
pkgver=1.1.4
pkgrel=1
pkgdesc='A command-line Last.fm scrobbler and a now-playing status updater.'
arch=(any)
license=(GPL)
url='https://gitlab.com/hauzer/scrobbler'
depends=(python3 python-appdirs python-docopt python-lfm)
makedepends=(python-setuptools)
source=(
  "https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
)
md5sums=('d516529c3f4a3940663d273980b15bff')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
