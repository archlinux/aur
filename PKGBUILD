# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='wd5741'
pkgver='20131220'
pkgrel='2'
pkgdesc='Firmware update utility for WD Red drives'
arch=('x86_64' 'i686' 'pentium4')
url='https://support.wdc.com/downloads.aspx?p=201&lang=en'
license=('unknown')
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64::https://fichiers.touslesdrivers.com/40252/${pkgname}x64")
source_i686=("$pkgname-$pkgver-$pkgrel-i686::https://fichiers.touslesdrivers.com/40253/${pkgname}x32")
source_pentium4=("$pkgname-$pkgver-$pkgrel-pentium4::https://fichiers.touslesdrivers.com/40253/${pkgname}x32")
sha512sums_x86_64=('9ce4159937f7b46dba16ffb0799a363d4519430c482fe3792382eccecc62dcab4f800fd2d6acc08359c692cc548924b3f8729a195cb056ac486037b8ed487f12')
sha512sums_i686=('2ef634b7cbf99ceb692c249e052fdae39df5cb49431810b6c2a302a9a82dc567853a136e618dfcc605099df0019acd28b06f2e7f39f55dcc48a1cc8ca593ba50')
sha512sums_pentium4=('2ef634b7cbf99ceb692c249e052fdae39df5cb49431810b6c2a302a9a82dc567853a136e618dfcc605099df0019acd28b06f2e7f39f55dcc48a1cc8ca593ba50')

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver-$pkgrel-$CARCH" "$pkgdir/usr/bin/$pkgname"
}
