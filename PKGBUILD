# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=transcribe
pkgver=8.62
pkgrel=1
pkgdesc="software to help transcribe recorded music"
arch=('i686' 'x86_64')
url="http://www.seventhstring.com/xscribe"
license=('GPL')
depends=('libsm' 'gtk3' 'gst-plugins-base-libs')
source_i686=(http://www.seventhstring.com/xscribe/downlinux32/xscsetup.tar.gz)
source_x86_64=(http://www.seventhstring.com/xscribe/downlinux64/xsc64setup.tar.gz)
md5sums_i686=('1d465c4c03d91de0c0f77bcfbdaa3933')
md5sums_x86_64=('e9c07cef3423e37dd6741ee8d86a4719')

package() {
	cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
