# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@protornmail.com>
pkgname=vim-lastplace
pkgver=3.1.1
pkgrel=1
pkgdesc="Intelligently reopen files at your last edit position in Vim."
arch=('any')
url="https://github.com/farmergreg/vim-lastplace"
license=('MIT')
depends=('vim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/farmergreg/vim-lastplace/archive/v$pkgver.tar.gz")
md5sums=('7a688354f5e3d69f9a898f9a4f471fbf')

package() {
	mkdir -p "$pkgdir/usr/share/vim/vimfiles/"{plugin,doc}
	cd "$pkgname-$pkgver"
	cp -r plugin/* "$pkgdir/usr/share/vim/vimfiles/plugin/"
	cp -r doc/* "$pkgdir/usr/share/vim/vimfiles/doc/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

