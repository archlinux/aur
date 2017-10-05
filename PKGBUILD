# Maintainer: aksr <aksr at t-com dot me>
pkgname=lzgrep
pkgver=0.99
pkgrel=1
epoch=
pkgdesc="LZgrep: A Direct (Ziv-Lempel) Compressed Text Search (Boyer-Moore String Matching) Tool"
arch=('i686' 'x86_64')
url="https://www.dcc.uchile.cl/~gnavarro/software/index.html"
license=('custom')
categories=()
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.dcc.uchile.cl/~gnavarro/software/$pkgname.tar.gz"
        "https://www.dcc.uchile.cl/~gnavarro/software/$pkgname.ps.gz")
noextract=()
options=()
md5sums=('eb936b084b50bd8ccc00469c97c083d8'
         '79675e2694f18397ed2b7cc93e24a124')
sha1sums=('ba08db7fb398267c2475eb214418dbe593750223'
          '7c17ef843792adaa07cee7488ce67fd58fd367b6')
sha256sums=('a37c6467837ef76b9ee20e43d314b3503e096ce79bce4e10805ebb0bff98a001'
            'b639baf69b5db8c7e896c96803033f67ab61fd18d25bc2871d4ed31a5d52f1c2')

build() {
  cd "$srcdir/"
  make
}

package() {
  cd "$srcdir/"
  install -D -m755 lzgrep $pkgdir/usr/bin/lzgrep
  install -D -m644 lzgrep.ps $pkgdir/usr/share/doc/$pkgname/lzgrep.ps
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

