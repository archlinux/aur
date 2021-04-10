# Maintainer: Yunindyo Prabowo <dyo.ndutz@gmail.com>
# Contributor: Muhammad Nabil Adani <nblid48@gmail.com>

pkgname=stowtui-git
pkgver=1.0.0
pkgrel=1
pkgdesc='stow tui is a Terminal User Interface Program for GNU STOW'
arch=('any')
url="https://github.com/ypraw/stowtui/"
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python' 'python-pygments' 'python-wcwidth' 'python-npyscreen')
source=("${pkgname}::git+https://github.com/ypraw/stowtui.git")
sha256sums=('SKIP')

package() {
   cd "$srcdir/$pkgname"
   python setup.py install --root="$pkgdir/" --optimize=1
}


