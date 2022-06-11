# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-dictd-moby-thesaurus
pkgver=2.4.2
pkgrel=1
pkgdesc='Moby Thesaurus II (English) for StarDict'
arch=('any')
url='http://download.huzheng.org/'
license=('GPL')
depends=('stardict')
source=("http://download.huzheng.org/dict.org/$pkgname-$pkgver.tar.bz2")
b2sums=('b6797311cf90e4c0e5f1d1b2dd8deb62dbcb22bd5a4968a3b01dce04ad1eac7b2a227d5c2818b47839263b28b7f457991aaa6f7873014ac68e9729042a46b681')

package()
{
	install -Dm644 "$pkgname-$pkgver/"* -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
