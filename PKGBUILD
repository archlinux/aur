# Maintainer: Dominik Schrempf <dominik dot schrempf at gmail dot com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=transcribe
pkgver=8.73
pkgrel=1
pkgdesc="music transcription aid"
arch=('i686' 'x86_64')
url="http://www.seventhstring.com/xscribe"
license=('unknown')
depends=('libsm' 'gtk3' 'gst-plugins-base-libs')
source_i686=('http://www.seventhstring.com/xscribe/downlinux32/xscsetup.tar.gz')
source_x86_64=('http://www.seventhstring.com/xscribe/downlinux64/xsc64setup.tar.gz')
md5sums_i686=('1c4e09cf87671e0c11afc2a089c3367c')
md5sums_x86_64=('1d6e705d01938fd69cc6395975fdafe5')

package() {
	cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
