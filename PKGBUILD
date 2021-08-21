# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>
pkgname=pq-cli
pkgver=1.0.2
pkgrel=1
pkgdesc="Progress Quest: the CLI edition"
arch=('any')
url="https://github.com/rr-/pq-cli"
license=('MIT')
depends=('python'
         'python-urwid'
         'python-urwid_readline'
         'python-xdg')

makedepends=('python-setuptools')

source=(${pkgname}.tar.gz::"https://github.com/rr-/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('8949a5e729c0dca5eb8ea94125021fdfc945653123e20a2cfbd0b916455229e2d77e21625afb3076342db3a4c6125ea502ad67e382eaa50b362d312f758802fc')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim: sw=2 ts=2 tw=80 et:
