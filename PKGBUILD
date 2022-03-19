# Maintainer: William Huang <wp /at/ nerde /dot/ pw>

pkgname=ttc-genwan
pkgver=1.501
pkgrel=1
pkgdesc='Open source Chinese/Japanese fonts based on Adobe Source Han.'
arch=('any')
url='https://github.com/ButTaiwan/genwan-font'
license=('OFL')

source=('https://github.com/ButTaiwan/genwan-font/releases/download/v1.501/GenWanMin.zip')
b2sums=('c73816097282165a057af7c83142b562e0b938eaa87d792f07b722f74682c106ede1baa1069c2d633c1e427a572efd1a58b055fc91af18caedecd92dc40a6bde')

package() {
	cd "$srcdir"
	install -Dm644 -t "$pkgdir/usr/share/fonts/genwan/" *.ttc
	install -Dm644 -t "$pkgdir/usr/share/licenses/genwan/" *.txt
}
