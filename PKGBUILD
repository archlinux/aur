# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
pkgname=kodelife
pkgver=0.8.5.99
pkgrel=1
pkgdesc='Real-time GPU shader editor, live-code performance tool and graphics prototyping sketchpad'
url='https://hexler.net/software/kodelife'
license=('unknown')
arch=('x86_64')
depends=('alsa-lib' 'libcurl-gnutls' 'gst-plugins-base-libs')
source=("https://hexler.net/pub/kodelife/$pkgname-$pkgver-linux-$arch.zip")
sha256sums=('40ff2bf3e9aa774157e750d8cff2e232cbc20e272adbe2df79def08ec56067d3')

package() {
	install -D -m755 "$srcdir/KodeLife" "$pkgdir/usr/bin/KodeLife"
}
