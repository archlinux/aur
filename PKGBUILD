# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=clap
pkgver=1.0.2
pkgrel=1
pkgdesc='Clever Audio Plugin API'
arch=(any)
url='https://cleveraudio.org'
license=(MIT)
groups=(pro-audio)
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/free-audio/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e99d297b9bca8dd71c4528f836840173e2415e2d5c800f0d475eed151924279d')

package() {
	cd $pkgname-$pkgver
	install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
	cp -va include "$pkgdir"/usr
}
