# Maintainer: Kira Sokolova <Kyra256@proton.me>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=klog-time-tracker-bin
pkgver=6.3
pkgrel=1
pkgdesc="A plain-text file format and a command line tool for time tracking."
arch=("x86_64")
url="https://github.com/jotaen/klog"
license=('MIT')
provides=("${pkgname%-bin}=$pkgver")
conflicts=('klog' "${pkgname%-bin}")
source=($pkgname-$pkgver.zip::https://github.com/jotaen/klog/releases/download/v$pkgver/klog-linux.zip)
sha256sums=('60e4e424f99417307d23ba3cc0b9bdabf03e6dc201390ad718b80a66e94ed14e')

package() {
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 klog "$pkgdir/usr/bin/klog"
}
