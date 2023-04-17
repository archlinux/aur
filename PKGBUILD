# Maintainer: Lucy "noirscape" <neko at catgirlsin dot space>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
_pkgname=twitter
pkgname=python-${_pkgname}
pkgver=1.19.6
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
#source=("https://pypi.python.org/packages/8a/9d/cea0ec784ba05d56fbd8a56a674ca12d9b012487528ce91e0064b19224f7/twitter-${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/t/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
sha256sums=('80ddd69ae2eeb88313feedeea31bf119fd6e79541ee5b37abb9c43d233194e10')

package() {
  cd "$srcdir/twitter-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
