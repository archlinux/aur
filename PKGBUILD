# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=keyoxidizer
pkgver=0.2.4
pkgrel=1
pkgdesc="Interactive Keyoxide helper"
arch=('x86_64')
url="https://github.com/shombando/$pkgname"
license=('APACHE')
b2sums=('05e1bb26c5d81702519a244ae971cb07dbfce4c6f75b14940185a998b7ef9942c8ed1493045836a1a80a1950ead00c0f0f5f724852678156c050ebfe4e628075')
source=($url/releases/download/v.$pkgver/$pkgname.sh)

package() {
	install -Dm775 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
