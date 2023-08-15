# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
# Maintainer: kyrella <kyrella at pm dot me>
pkgname=kodelife
pkgver=1.1.1.175
pkgrel=1
pkgdesc='Real-time GPU shader editor, live-code performance tool and graphics prototyping sketchpad'
url='https://hexler.net/software/kodelife'
license=('unknown')
arch=('x86_64')
depends=('alsa-lib' 'libcurl-gnutls' 'gst-plugins-base-libs')
source=("https://hexler.net/pub/kodelife/$pkgname-$pkgver-linux-x64.zip")
sha256sums=('596f43361ea431b040a36ea6519991457f214ff94ae5f62ec9a1abb354a5f1c0')

package() {
	install -D -m755 "$srcdir/KodeLife" "$pkgdir/usr/bin/KodeLife"
}
