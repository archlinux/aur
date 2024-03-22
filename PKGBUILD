# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=keyoxidizer
pkgver=0.3
pkgrel=1
pkgdesc="Interactive Keyoxide helper"
arch=('x86_64')
url="https://github.com/shombando/$pkgname"
license=('APACHE')
b2sums=('SKIP')
source=("git+$url#tag=v.$pkgver")

package() {
	install -Dm775 $pkgname/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
	install -Dm775 $pkgname/setRemotes.sh "$pkgdir"/usr/bin/setRemotes.sh
}
