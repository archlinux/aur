# Maintainer: Kira Sokolova <Kyra256@proton.me>

pkgname=klog-time-tracker-bin
pkgver=v6.1
pkgrel=1
pkgdesc="A plain-text file format and a command line tool for time tracking."
arch=("x86_64")
url="https://github.com/jotaen/klog"
license=('MIT')
depends=('glibc>=2.37-3')
conflicts=('klog-bin' 'klog')
source=($pkgname-$pkgver.zip::https://github.com/jotaen/klog/releases/download/$pkgver/klog-linux.zip)
sha256sums=('9071517afbd181c917dd47e2de9d579f965c8810dd1ca5970ea0a700fd798ead')

package() {
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 klog "$pkgdir/usr/bin/klog"
}
