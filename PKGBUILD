# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=transcribe
pkgver=8.71
pkgrel=1
pkgdesc="software to help transcribe recorded music"
arch=('i686' 'x86_64')
url="http://www.seventhstring.com/xscribe"
license=('unknown')
depends=('libsm' 'gtk3' 'gst-plugins-base-libs')
source_i686=('http://www.seventhstring.com/xscribe/downlinux32/xscsetup.tar.gz')
source_x86_64=('http://www.seventhstring.com/xscribe/downlinux64/xsc64setup.tar.gz')
md5sums_i686=('2f089229edf91f0e04d6d3fd638c8f74')
md5sums_x86_64=('6da56d0683d82885c22cfb32dfe4836d')

package() {
	cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
