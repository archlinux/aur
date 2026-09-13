# Maintainer: amalxloop 

pkgname=aniterm
pkgver=1.0.29
pkgrel=1
pkgdesc="Stream anime from your terminal"
arch=('any')
url="https://github.com/amalxloop/aniterm"
license=('GPL-3.0-only')
depends=('python' 'mpv' 'yt-dlp' 'python-curl-cffi')
makedepends=('python-pip')
source=("$pkgname-$pkgver::https://github.com/amalxloop/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  pip install --prefix="$pkgdir/usr" --no-deps "$srcdir/$pkgname-$pkgver"
}