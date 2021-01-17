# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-rotate'
pkgver=0.1
pkgrel=3
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
source=(https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('019dd53fa1d5d9435fe7bdcabb0f2c8c1490d00a74a28f466f9027d1d593b5db6afc333f8b855f9b33268c36092917bcc53dd4616a914b0842f38526431c410b')
options=(!emptydirs)

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
