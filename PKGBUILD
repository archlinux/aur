# Maintainer: Muhammad Dhiyaul Atha <mdhiyaulatha@gmail.com>

pkgname=jadwal-shalat
pkgver=1.0.9
pkgrel=1
pkgdesc="CLI tool profesional untuk menampilkan jadwal shalat otomatis berdasarkan lokasi IP atau manual."
arch=('any')
url="https://github.com/Bangkah/jadwal-shalat"
license=('MIT')

depends=('python' 'python-requests')
optdepends=('python-tzdata: timezone database support')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Bangkah/jadwal-shalat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 jadwal-shalat.py "$pkgdir/usr/bin/jadwal-shalat"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
