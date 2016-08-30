# Maintainer: dtluna <dtluna at openmailbox dot org>

_pkg_name=gs_reply_bot
pkgname=gs-reply-bot
pkgver=1.1.1
pkgrel=1
pkgdesc="Automatic reply bot for GNU Social."
arch=('any')
url="https://gitgud.io/dtluna/${_pkg_name}"
license=('GPL3')
depends=('python' 'python-gnusocial')
makedepends=('python-setuptools')
source=("${url}/repository/archive.tar.gz?ref=v${pkgver}")
md5sums=('94430f188d67bf8f25c2175f4f7ac66b')

package() {
  cd "${srcdir}/${_pkg_name}-v${pkgver}-1db7ecc22af2520400494a5f46d1a00e45cd7b05/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
