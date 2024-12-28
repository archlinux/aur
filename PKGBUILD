# Maintainer: William Huang <wp /at/ nerde /dot/ pw>

pkgname=ttc-genwan
pkgver=2.100
pkgrel=1
pkgdesc='Open source Chinese/Japanese fonts based on Adobe Source Han.'
arch=('any')
url='https://github.com/ButTaiwan/genwan-font'
license=('OFL')

source=('https://github.com/ButTaiwan/genwan-font/releases/download/v2.100/GenWanMin2-ttc.zip')
b2sums=('9c6f2e6be1aee63a2c79edb59d4d6137f5ea1f81356a1d2166aea967eb696a5099f2f35553b32c287abb4f1929a08aacf5863c73a9ea1198f30f441a496019d6')

package() {
	cd "$srcdir"
	install -Dm644 -t "$pkgdir/usr/share/fonts/genwan/" *.ttc
	install -Dm644 -t "$pkgdir/usr/share/licenses/genwan/" *.txt
}
