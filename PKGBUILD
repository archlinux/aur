# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=epymc
pkgver=1.2.0
pkgrel=1
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
sha256sums=('474eaa9c0b6415d0aeec27b47b54740270ab241c5d64aa07afa5578354a6039a')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
