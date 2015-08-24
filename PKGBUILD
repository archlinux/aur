# Maintainer: 謝致邦 <Yeking@Red54.com>
# Maintainer: lisongmin <lisongmin9@gmail.com> from 2015-08-25

pkgname=stardict-langdao-ce-gb
pkgver=2.4.2
pkgrel=4
pkgdesc="Chinese-English dictionary of Langdao for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.huzheng.org"
md5sums=('8e9700798a0ffeed23207b7cf2592246')
source=(http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-langdao-ce-gb-$pkgver.tar.bz2)
arch=('any')

package() {
	cd $srcdir/stardict-langdao-ce-gb-$pkgver
	local _dir=$pkgdir/usr/share/stardict/dic/
	mkdir -p $_dir
	install -m 644 langdao-ce-gb.dict.dz $_dir
	install -m 644 langdao-ce-gb.idx $_dir
	install -m 644 langdao-ce-gb.ifo $_dir
}
