# Maintainer: Kira Sokolova <Kyra256@proton.me>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=klog-time-tracker-bin
pkgver=6.5
pkgrel=1
pkgdesc="A plain-text file format and a command line tool for time tracking."
arch=("x86_64")
url="https://github.com/jotaen/klog"
license=('MIT')
provides=("${pkgname%-bin}=$pkgver")
conflicts=('klog' "${pkgname%-bin}")
source=($pkgname-$pkgver.zip::$url/releases/download/v$pkgver/klog-linux.zip)
sha256sums=('f837940e900fa4facf3f7acf131ff259e78e0a1e718d136824dad4bdca908aab')

package() {
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 klog "$pkgdir/usr/bin/klog"
}
