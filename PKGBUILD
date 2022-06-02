# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-rotate'
pkgver=0.1
pkgrel=4
pkgdesc='A tool and library for rotating your password on online services'
arch=('any')
url='https://git.sr.ht/~sircmpwn/pass-rotate'
license=('MIT')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-docopt'
  'python-requests'
  'python-html5lib'
)
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('3c206727439f674cc8eb0429d4adcfca607f3c5187fec7cfee3a7b8e6b461d473955bd68cf159a3f88bb5b6c6e2be5f69f131f187d74ef0228d62817247b4696')
options=(!emptydirs)

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
