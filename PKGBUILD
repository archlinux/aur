# Maintainer: Jackson Baker Ryan <jackson.baker.ryan at gmail dot com>

pkgname=otf-nimbus-mono
pkgdesc="Nimbus Mono typeface - A serif, typewriter typeface"
pkgver=1.0
pkgrel=1
arch=('any')
source=("https://www.fontsquirrel.com/fonts/download/nimbus-mono.zip")

package() {
	cd $srcdir
	for f in *.otf; do
  		install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/nimbus-mono" "$f"
	done
  		install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/license.txt" GNU\ General\ Public\ License.txt
}
