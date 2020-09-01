# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
pkgname=kodelife
pkgver=0.9.4.137
pkgrel=1
pkgdesc='Real-time GPU shader editor, live-code performance tool and graphics prototyping sketchpad'
url='https://hexler.net/software/kodelife'
license=('unknown')
arch=('x86_64')
depends=('alsa-lib' 'libcurl-gnutls' 'gst-plugins-base-libs')
source=("https://hexler.net/pub/kodelife/$pkgname-$pkgver-linux-$arch.zip")
sha256sums=('5212ad3369464763113114f70469146847a3705dfc9bcd9736108fb636b3b0f1')

package() {
	install -D -m755 "$srcdir/KodeLife" "$pkgdir/usr/bin/KodeLife"
}
