# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=vlila
pkgver=1.0
pkgrel=1
arch=('any')
depends=('qtscrcpy')
source=(
	'momo.json'
	'yuedu.json'
)
sha512sums=(
	'442ec4f849fc4cf4d0c24cb4b03be2f2bec892a2fedaa0c1d7dbc038565d40277ece251599f5153881d31e37f185a50f2c6236293155f12a1c9da8ace3576f3f'
	'c0a4d5ec70f3b3aeec68ed394a32fda4a2a81af753179b59e6ebf42e7f73c1e2341ad5601fda480cf9ec44948f7da7a69b088168073966c7aaa562afc545c440')

package() {
	install -Dm755 $srcdir/momo.json $pkgdir/opt/qtscrcpy/keymap/momo.json
	install -Dm755 $srcdir/yuedu.json $pkgdir/opt/qtscrcpy/keymap/yuedu.json
}
