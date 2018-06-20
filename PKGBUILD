# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
pkgname=kodelife
pkgver=0.5.7.0
pkgrel=1
pkgdesc='Real-time GPU shader editor, live-code performance tool and graphics prototyping sketchpad'
url='https://hexler.net/software/kodelife'
license=('unknown')
arch=('x86_64')
depends=('alsa-lib' 'libglvnd' 'libxcursor' 'libxinerama' 'libxrandr' 'libcurl-gnutls')
source=("https://hexler.net/pub/kodelife/$pkgname-$pkgver-linux-$arch.zip")
sha256sums=('1b710e1fb73b47a99e0335497c5f86029072d72720ef10979b7e4a13bf684293')

package() {
	install -D -m755 "$srcdir/KodeLife" "$pkgdir/usr/bin/KodeLife"
}
