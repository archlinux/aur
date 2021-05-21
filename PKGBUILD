# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
pkgname=kodelife
pkgver=0.9.9.148
pkgrel=1
pkgdesc='Real-time GPU shader editor, live-code performance tool and graphics prototyping sketchpad'
url='https://hexler.net/software/kodelife'
license=('unknown')
arch=('x86_64')
depends=('alsa-lib' 'libcurl-gnutls' 'gst-plugins-base-libs')
source=("https://hexler.net/pub/kodelife/$pkgname-$pkgver-linux-$arch.zip")
sha256sums=('534f79c96b17e9890d0c0f2ff7829ae282e6eaf4ef79ef2490603455dc4909bc')

package() {
	install -D -m755 "$srcdir/KodeLife" "$pkgdir/usr/bin/KodeLife"
}
