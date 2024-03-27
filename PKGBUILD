# Maintainer: Kira Sokolova <Kyra256@proton.me>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=klog-time-tracker-bin
pkgver=6.2
pkgrel=3
pkgdesc="A plain-text file format and a command line tool for time tracking."
arch=("x86_64")
url="https://github.com/jotaen/klog"
license=('MIT')
provides=("${pkgname%-bin}=$pkgver")
conflicts=('klog' "${pkgname%-bin}")
source=($pkgname-$pkgver.zip::https://github.com/jotaen/klog/releases/download/v$pkgver/klog-linux.zip)
sha256sums=('7434d603d785c29cd170ff6c9c9f38bf9e3cb1b7811faeb38223213cf1c9ffca')

package() {
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 klog "$pkgdir/usr/bin/klog"
}
