# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
pkgname=kodelife
pkgver=0.5.4.0
pkgrel=2
pkgdesc='Real-time GPU shader editor, live-code performance tool and graphics prototyping sketchpad'
url='https://hexler.net/software/kodelife'
license=('unknown')
arch=('x86_64')
depends=('alsa-lib' 'libglvnd' 'libxcursor' 'libxinerama' 'libxrandr' 'libcurl-gnutls')
source=("https://hexler.net/pub/kodelife/$pkgname-$pkgver-linux-$arch.zip")
sha256sums=('60c6251be7960c9b12f0c621125a44a640679580eaf72af811956811c9b46863')

package() {
	install -D -m755 "$srcdir/KodeLife" "$pkgdir/usr/bin/KodeLife"
}
