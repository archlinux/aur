# Maintainer: Dominik Schrempf <dominik dot schrempf at gmail dot com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=transcribe
pkgver=8.72
pkgrel=1
pkgdesc="music transcription aid"
arch=('i686' 'x86_64')
url="http://www.seventhstring.com/xscribe"
license=('unknown')
depends=('libsm' 'gtk3' 'gst-plugins-base-libs')
source_i686=('http://www.seventhstring.com/xscribe/downlinux32/xscsetup.tar.gz')
source_x86_64=('http://www.seventhstring.com/xscribe/downlinux64/xsc64setup.tar.gz')
md5sums_i686=('ad2f49b506f0af62c681cf88a8a72ce6')
md5sums_x86_64=('22e6c79b20e0e25f7a7708acceb6d5a1')

package() {
	cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
