# Maintainer: 謝致邦 <Yeking@Red54.com>
# Maintainer: lisongmin <lisongmin9@gmail.com> from 2015-09-25

pkgname=stardict-cdict-gb
pkgver=2.4.2
pkgrel=4
pkgdesc="English-Chinese dictionary of cdict for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.huzheng.org"
md5sums=('68e539f362de416490b78fed97aba780')
source=(http://abloz.com/huzheng/stardict-dic/zh_CN/$pkgname-$pkgver.tar.bz2)
arch=('any')

package() {
	cd $srcdir/$pkgname-$pkgver

	local _dic_name=${pkgname##stardict-}
	local _dir=$pkgdir/usr/share/stardict/dic/

	mkdir -p $_dir
	install -m 644 ${_dic_name}.dict.dz $_dir
	install -m 644 ${_dic_name}.idx $_dir
	install -m 644 ${_dic_name}.ifo $_dir
}
