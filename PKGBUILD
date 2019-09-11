# Maintainer: Valentijn "noirscape" V. <neko at catgirlsin dot space>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=python-twitter
pkgver=1.18.0
pkgrel=2
pkgdesc='An API and command-line toolset for Twitter (twitter.com)'
arch=('any')
url='http://pypi.python.org/pypi/twitter/'
license=('MIT')
depends=('python')
optdepends=('python-irc: twitter ircbot dependency')
replaces=('python-twitter-tools')
makedepends=('python-setuptools')
conflicts=('python-twitter-tools' 'python-twitter-tools-git' 'python-twitter-git')
source=("https://pypi.python.org/packages/8a/9d/cea0ec784ba05d56fbd8a56a674ca12d9b012487528ce91e0064b19224f7/twitter-${pkgver}.tar.gz")
sha256sums=('acdc85e5beea752967bb64c63bde8b915c49a31a01db1b2fecccf9f2c1d5c44d')

package() {
  cd "$srcdir/twitter-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
