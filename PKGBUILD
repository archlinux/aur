# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=transcribe
pkgver=8.70
pkgrel=1
pkgdesc="software to help transcribe recorded music"
arch=('i686' 'x86_64')
url="http://www.seventhstring.com/xscribe"
license=('GPL')
depends=('libsm' 'gtk3' 'gst-plugins-base-libs')
#depends=('glib2' 'gtk3')
source_i686=(http://www.seventhstring.com/xscribe/downlinux32/xscsetup.tar.gz)
source_x86_64=(http://www.seventhstring.com/xscribe/downlinux64/xsc64setup.tar.gz)
md5sums_i686=('31069cb5808b18553e3e0a6e79b23eb0')
md5sums_x86_64=('acdccf60a944c591aee179eea8df8d37')

package() {
	cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
