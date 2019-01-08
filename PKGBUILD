# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.13.1
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'colordiff')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.13.1.tar.gz')
sha256sums=('3766f75ca38e852c64dbff4d091b3828e9fea60024bdd5ef310b111973760fce')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
