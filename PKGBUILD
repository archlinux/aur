# Maintainer:  Erikas Rudinskas (erikmnkl@gmail.com)

pkgname='optiprime'
pkgver='1'
pkgrel='2'
pkgdesc='Primusrun with vblank_mode=0 parameter (vsync disabled, higher framerate, no mouse lag).'
arch=('any')
url='http://askubuntu.com/questions/297596/vblank-mode-0-primusrun-in-application-desktop-file'
provides=('optiprime')
source=("optiprime")
md5sums=('e2ae018cba879eac3b52baef0b3700c6')

package() {
	#create directories:
	install -d "${pkgdir}/usr/bin"

	#mv script to required directory:
	install -m 755 "$srcdir"/optiprime "$pkgdir"/usr/bin/
}