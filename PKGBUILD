# Maintainer: Michael Rupert <michaelrupert@fastmail.com>
pkgname=medievia-fonts
pkgver=1.0
pkgrel=12
pkgdesc='Bitmap and TTF Fonts for use with Medievia'
arch=('any')
url="http://www.medievia.com/fonts.html"
license=('custom:Medievia')
provides=('ttf-font')
_files=('Medievia.fon'
	'MedSansMono.ttf')
_dlpath="http://www.medievia.com/fonts"
source=("${_files[@]/#/$_dlpath/}")
sha256sums=('3c273aec850fb61d58e244e5d79e3b685b9a9ce1afc02fc7e12039a6c8335e8c'
	    '1d8d79143999e2491383ac18be9e720608214bb0c0d4de4211850314772b1e76')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" MedSansMono.ttf
    install -Dm644 -t "$pkgdir/usr/share/fonts/Bitmap" Medievia.fon 
}

