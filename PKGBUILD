# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
# Maintainer: kyrella <arch at kyrella dot xyz>
pkgname=kodelife
pkgver=1.1.9.194
pkgrel=1
pkgdesc='Real-time GPU shader editor, live-code performance tool and graphics prototyping sketchpad'
url='https://hexler.net/software/kodelife'
license=('unknown')
arch=('x86_64')
depends=('alsa-lib' 'libcurl-gnutls' 'gst-plugins-base-libs')
source=("https://hexler.net/pub/kodelife/$pkgname-$pkgver-linux-x64.zip")
sha256sums=('bdb8fd0bc33a3fac1a2551c62ec5eaf9879beb3d4154fc73525475410069c267')

package() {
	install -D -m755 "$srcdir/KodeLife" "$pkgdir/usr/bin/KodeLife"
}
