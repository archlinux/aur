# Maintainer: Max Gautier <mg@max.gautier.name>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=vim-lastplace
pkgver=4.0.0
pkgrel=1
pkgdesc="Intelligently reopen files at your last edit position in Vim."
arch=('any')
url="https://github.com/farmergreg/vim-lastplace"
license=('MIT')
depends=('vim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/farmergreg/vim-lastplace/archive/v$pkgver.tar.gz")
b2sums=('85f4d1d9c6431e3efbc953e8e37a2468c4af419896ecea2c510c01295e94d98f1eb5c98dc6e3282a364bb392f4069547bfdf3046a5911adc27964a80abd6aec6')

package() {
	mkdir -p "$pkgdir/usr/share/vim/vimfiles/"{plugin,doc}
	cd "$pkgname-$pkgver"
	cp -r plugin/* "$pkgdir/usr/share/vim/vimfiles/plugin/"
	cp -r doc/* "$pkgdir/usr/share/vim/vimfiles/doc/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
