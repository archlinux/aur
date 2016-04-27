# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=epymc
pkgver=1.1.0
pkgrel=3
pkgdesc="Media Center based on EFL"
arch=('any')
url="https://github.com/DaveMDS/epymc"
license=('GPL3')
depends=('python-efl')
optdepends=('lirc: remote contol support'
            'python-mutagen: Music module'
            'python-beautifulsoup4: Online Channels module'
            'sdlmame: MAME module')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveMDS/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a36968c99eda910103cf35f80686b1a92f61b34d9054aa2a5e38089f9c4e9083')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
