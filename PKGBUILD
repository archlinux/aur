# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='wd5741'
pkgver='20131220'
pkgrel='2'
pkgdesc='Firmware update utility for WD Red drives'
arch=('x86_64' 'i686')
url='https://support.wdc.com/downloads.aspx?p=201&lang=en'
license=('unknown')
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64::https://fichiers.touslesdrivers.com/40252/wd5741x64")
source_i686=("$pkgname-$pkgver-$pkgrel-i686::https://fichiers.touslesdrivers.com/40253/wd5741x32")
sha256sums_x86_64=('28eabf6382a5928c3f193c8a7ad48d691d068ee297832e6763d1ab8e7136ccf5')
sha256sums_i686=('d577316864c56bfc3b512d3ab4c8cbc9721d08863ee779f5fd8ee9a0b18f589d')

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver-$pkgrel-$CARCH" "$pkgdir/usr/bin/$pkgname"
}
