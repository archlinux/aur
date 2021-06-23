# Maintainer: Lucy "noirscape" <neko at catgirlsin dot space>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
_pkgname=twitter
pkgname=python-${_pkgname}
pkgver=1.19.3
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
sha256sums=('a56ff9575fbd50a51ce91107dcb5a4c3fd00c2ba1bcb172ce538b0948d3626e6')

package() {
  cd "$srcdir/twitter-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
