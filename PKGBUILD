# Maintainer: aksr <aksr at t-com dot me>
pkgname=fig2pstricks
pkgver=0.7.2
pkgrel=1
epoch=
pkgdesc="A fig-to-pstricks converter."
arch=(any)
url="http://freecode.com/projects/fig2pstricks"
license=('GPLv2')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('xfig' 'texlive-pstricks')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://econ.korea.ac.kr/~chirokhan/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('cd01b5a758018340f1339a55147d7e91')
sha1sums=('1fd78e8fa1fe7a38a61545c8514f03fb96c37c36')
sha256sums=('a4f266c6a648114dea9d6a4d9299a1a66dbb95b78da0557c7973eefdf30d4515')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 fig2pstricks $pkgdir/usr/bin/fig2pstricks
  install -Dm 755 fig2epspdf $pkgdir/usr/bin/fig2epspdf
  install -Dm 644 README $pkgdir/usr/share/doc/$pkgname/README
}

