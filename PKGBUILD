# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=keyoxidizer
pkgver=0.3
pkgrel=1
pkgdesc="Interactive Keyoxide helper"
arch=('x86_64')
url="https://github.com/shombando/$pkgname"
makedepends=('git')
license=('APACHE')
b2sums=('f9a4e50272d4d132c7ab1c5cd7a2591b0a2fa53a8ae5391dbeb65ea66a71597bf2c1a61b1394503224023f4a84794ad377ff0657864d88d409c293fe009747a3')
source=("git+$url#tag=v.$pkgver")

package() {
	install -Dm775 $pkgname/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
	install -Dm775 $pkgname/setRemotes.sh "$pkgdir"/usr/bin/setRemotes.sh
}
