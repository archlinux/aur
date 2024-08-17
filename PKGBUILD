# Maintainer: Kira Sokolova <Kyra256@proton.me>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=klog-time-tracker-bin
pkgver=6.4
pkgrel=1
pkgdesc="A plain-text file format and a command line tool for time tracking."
arch=("x86_64")
url="https://github.com/jotaen/klog"
license=('MIT')
provides=("${pkgname%-bin}=$pkgver")
conflicts=('klog' "${pkgname%-bin}")
source=($pkgname-$pkgver.zip::https://github.com/jotaen/klog/releases/download/v$pkgver/klog-linux.zip)
sha256sums=('e7ce562b013529068f46e8b7b3fa64781d06f70135a8f3c5d7f265850966162b')

package() {
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 klog "$pkgdir/usr/bin/klog"
}
