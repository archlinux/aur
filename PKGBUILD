# Maintainer: Dominik Schrempf <dominik dot schrempf at gmail dot com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=transcribe
pkgver=8.74.1
pkgrel=1
pkgdesc="music transcription aid"
arch=('i686' 'x86_64')
url="http://www.seventhstring.com/xscribe/overview.html"
license=('unknown')
depends=('libsm' 'gtk3' 'gst-plugins-base-libs')
source_x86_64=('https://www.seventhstring.com/xscribe/xsc64setup.tar.gz')
md5sums_x86_64=('f91aa53bd4d959521b55810bf3b67ed4')

package() {
	cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 libgstvideosection.so "$pkgdir/usr/lib/libgstvideosection.so"
}

# vim:set ts=2 sw=2 et:
