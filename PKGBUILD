# Maintainer: Korbinian Reischl <info@korbireischl.de>
# Contributor: Kira Sokolova <Kyra256@proton.me>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=klog-time-tracker-bin
pkgver=7.1
pkgrel=1
pkgdesc="A plain-text file format and a command line tool for time tracking."
arch=("x86_64")
url="https://github.com/jotaen/klog"
license=('MIT')
provides=("${pkgname%-bin}=$pkgver")
conflicts=('klog' "${pkgname%-bin}")
source=($pkgname-$pkgver.zip::$url/releases/download/v$pkgver/klog-linux.zip)
sha256sums=('ef2838bd5428980a480c28498db32147602b4c7d5b35763bd41495e25b960702')

package() {
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 klog "$pkgdir/usr/bin/klog"
}
