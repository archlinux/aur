# Maintainer: Alex Tharp <toastercup@gmail.com>

pkgname=foobar2000-component-audioscrobbler-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A Last.fm/Audioscrobbler component for foobar2000"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_audioscrobbler"
license=('unknown')
depends=('foobar2000>=1.0.0')
conflicts=('foobar2000-audioscrobbler-bin')
source=("https://www.foobar2000.org/getcomponent/9db8480904ab94a051842d7c2f92adc1/foo_audioscrobbler.fb2k-component")
sha256sums=('e848e71805f4a5d5662ef8060b5667819d81478a96be278d0024ce7b7e685d61')

package() {
	install -Dm644 -t "$pkgdir/usr/share/foobar2000/components" "$srcdir/foo_audioscrobbler.dll"
}
