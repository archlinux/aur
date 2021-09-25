# Maintainer: M Nabil Adani <nblid48[at]gmail[dot]com>

pkgname=sapulatar-qt
pkgver=1.0.dev1
pkgrel=1
pkgdesc='A simple gui apps to help you remove background from various images.'
arch=('any')
url="https://github.com/devlovers-id/sapulatar-qt"
license=('GPLv3')
makedepends=('python-setuptools')
depends=('pyside2' 'python')
source=("${pkgname}::git+https://github.com/devlovers-id/sapulatar-qt")
sha256sums=('SKIP')

# pkgver(){
#     cd "${pkgname}"
#     git describe --long | cut -d "-" -f 1
# }

package() {
   cd "$srcdir/$pkgname"
   python setup.py install --root="$pkgdir/" --optimize=1
}


