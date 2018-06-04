# Maintainer: Przemysław Buczkowski <przemub@przemub.pl>

pkgname=lotterhoffcrash
pkgver=1.0
pkgrel=1
pkgdesc="Enhance your Arch Linux experience with Miss Lotterhoff and Mr Dobecki"
arch=(i686 x86_64)
url="https://1mi.pl/~lachcim/wa%c5%bcne%20programy/"
license=('unknown')
depends=(wine wine-mono)
source=(launcher https://1mi.pl/~lachcim/wa%c5%bcne%20programy/lotterhoffcrash.exe)
md5sums=('4e4996896dcc7252a3aba80627c55636'
         'a464cbac89bf42cb3a3d120b022e11be')

package() {
	mkdir -p $pkgdir/usr/bin
	cp launcher $pkgdir/usr/bin/lotterhoffcrash

	mkdir -p $pkgdir/opt
	cp lotterhoffcrash.exe $pkgdir/opt
}
