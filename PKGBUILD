# Maintainer: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Replacement for Python's SimpleHTTPServer"
arch=("x86_64" "i386" "arm64")
url="https://github.com/patrickhener/goshs"
license=("MIT")
provides=("goshs")
conflicts=("goshs")
source=("https://github.com/patrickhener/goshs/releases/download/v${pkgver}/goshs_${pkgver}_Linux_${CARCH}.tar.gz")
sha512sums=("SKIP")
package() {
	cd $srcdir
	install -Dm755 $srcdir/goshs $pkgdir/usr/bin/goshs
	install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/goshs/LICENSE"
}
