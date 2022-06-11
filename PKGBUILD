# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-oxford-gb-formated
pkgver=2.4.2
pkgrel=1
pkgdesc='Oxford English-Chinese Dictionary (Formated) for StarDict'
arch=('any')
url='http://download.huzheng.org/'
license=('GPL')
depends=('stardict')
source=("http://download.huzheng.org/zh_CN/$pkgname-$pkgver.tar.bz2")
b2sums=('0770a10211a79cab400bd52f50e1b66c9852b29b94ec78888a6ad613c74dd9e9b548c75daa6585d347fc774cc16844107c0b5baea12f75bd48ac25a1d5f1aabd')

package()
{
	install -Dm644 "$pkgname-$pkgver/"* -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
