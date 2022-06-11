# Maintainer: Xiao Pan <gky44px1999@gmail.com>
pkgname=stardict-mdbg-cc-cedict
pkgver=2.4.2
pkgrel=1
pkgdesc='MDBG CC-CEDICT Chinese-English Dictionary for StarDict'
arch=('any')
url='http://download.huzheng.org/'
license=('cc-by-sa-3.0')
depends=('stardict')
source=("http://download.huzheng.org/zh_CN/$pkgname-$pkgver.tar.bz2")
b2sums=('837ce30b9010560614114b78db85807a6554f4be607111a5efe56b1999a0a6f84d9be03058d4d1eaa67c1eecfb689d953e57cc486d9e45ffbc014158263678c2')

package()
{
	install -Dm644 "$pkgname-$pkgver/"* -t "$pkgdir/usr/share/stardict/dic/${pkgname#stardict-}"
}
