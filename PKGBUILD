# Maintainer: graysky <graysky AT archlinux DOT us>

# Do NOT change the PKGEXT variable since videos do not need to be compressed
PKGEXT='.pkg.tar'
pkgname='xscreensaver-aerial-videos'
pkgver=1.03
pkgrel=1
arch=('any')
url="http://a1.phobos.apple.com/us/r1000/000/Features/atv/AutumnResources/videos"
pkgdesc='Apple TV4 HD aerial movies'
source=("$url/b10-1.mov"
"$url/b10-2.mov"
"$url/b10-3.mov"
"$url/b10-4.mov"
"$url/b1-1.mov"
"$url/b1-2.mov"
"$url/b1-3.mov"
"$url/b1-4.mov"
"$url/b2-1.mov"
"$url/b2-2.mov"
"$url/b2-3.mov"
"$url/b2-4.mov"
"$url/b3-1.mov"
"$url/b3-2.mov"
"$url/b3-3.mov"
"$url/b4-1.mov"
"$url/b4-2.mov"
"$url/b4-3.mov"
"$url/b5-1.mov"
"$url/b5-2.mov"
"$url/b5-3.mov"
"$url/b6-1.mov"
"$url/b6-2.mov"
"$url/b6-3.mov"
"$url/b6-4.mov"
"$url/b7-1.mov"
"$url/b7-2.mov"
"$url/b7-3.mov"
"$url/b8-1.mov"
"$url/b8-2.mov"
"$url/b8-3.mov"
"$url/b9-1.mov"
"$url/b9-2.mov"
"$url/b9-3.mov")
sha1sums=('21eaac6e0f0f4d5ca56f4a4b809d550776950852'
          'f5b782a1589e7fe42db354c6f8b679165e0bf67f'
          'c64238c62ed96a92227f69f501b90c493e381901'
          '43264cb243cdd7b9e2d7c32bcdcdc396e4887841'
          '21eaac6e0f0f4d5ca56f4a4b809d550776950852'
          '2aeddc8252072df105686b0305b8a355299287c0'
          '9cda0a74d3bfe9dbfd53c86a33f01dcb2cfb9c90'
          '5048e77a22abb87d096c56149164d0e553b0324c'
          '838c8d16b5f9de7576410d48710c79887dd465c1'
          '4b61a0cdcecc262863ab60543bedcd52b122ce03'
          'f5b782a1589e7fe42db354c6f8b679165e0bf67f'
          '43264cb243cdd7b9e2d7c32bcdcdc396e4887841'
          '3dd2731ee1169047c9f40eeef019ef1af367e5c5'
          '2c56ce9c116e6ce15ed7fa0dbdc9975a3ce46fc2'
          '668ca3d83def0370a43841c98f3656f9cf9a9dc6'
          'f0ce70709bbae17b809f9ac8057017b725ff9041'
          '496f05c1747e7c25ce6f103fda408ae71fbe7f28'
          'e7e7bbc0762694c6b026d8c90ee9ee35e05dd84f'
          'f9efd6544ba62a486701d06360e67a1f5dc08cec'
          '37e5f26ad97789eba95115c27234d1a154ac5886'
          '5143747795b86f093ccb4ca60991136305283156'
          '966ef45bb6187a42f50de52c91f72472a44689bf'
          '07e3f9cbd66048ef3961fb3066a9a24e2cb25941'
          '265370fae2ca422b6d05a6069c3144862d595227'
          '799fa24415292488ff960924191ff2d892d001b4'
          'a504b71c312df29c27efb37dec0249e17ab4c1d5'
          'b238dde8545649d0c2d0ce1a65c8da31e603d1cc'
          'c66e98384d0b097de7cbc6c9346d76a9cfe40fa2'
          'cbe07505831b97e5ac40677d547dabbb940299c1'
          'e9e1615a0df1375d1742a534f5d22b82fc336f7b'
          '40dbf63e91199045e77155cc2d20ee1dae693119'
          '4b61a0cdcecc262863ab60543bedcd52b122ce03'
          'a1a9569428dbf924c2c77e0d6398e607c99bcae9'
          '8cfa5a6152be807ff458174f8420eb0a4a307ec2')

package() {
	# This package is optional as the xscreensaver will stream the videos directly
	# from apple which will save approx 5.3 GB of disk space but know that you
	# will be using bandwidth everytime your screensaver comes on which might
	# impact you if your ISP caps your bandwidth
	cd "$srcdir"
	install -Dm644 b10-1.mov "${pkgdir}/opt/ATV4/b10-1.mov"
	install -Dm644 b10-2.mov "${pkgdir}/opt/ATV4/b10-2.mov"
	install -Dm644 b10-3.mov "${pkgdir}/opt/ATV4/b10-3.mov"
	install -Dm644 b10-4.mov "${pkgdir}/opt/ATV4/b10-4.mov"
	install -Dm644 b1-1.mov "${pkgdir}/opt/ATV4/b1-1.mov"
	install -Dm644 b1-2.mov "${pkgdir}/opt/ATV4/b1-2.mov"
	install -Dm644 b1-3.mov "${pkgdir}/opt/ATV4/b1-3.mov"
	install -Dm644 b1-4.mov "${pkgdir}/opt/ATV4/b1-4.mov"
	install -Dm644 b2-1.mov "${pkgdir}/opt/ATV4/b2-1.mov"
	install -Dm644 b2-2.mov "${pkgdir}/opt/ATV4/b2-2.mov"
	install -Dm644 b2-3.mov "${pkgdir}/opt/ATV4/b2-3.mov"
	install -Dm644 b2-4.mov "${pkgdir}/opt/ATV4/b2-4.mov"
	install -Dm644 b3-1.mov "${pkgdir}/opt/ATV4/b3-1.mov"
	install -Dm644 b3-2.mov "${pkgdir}/opt/ATV4/b3-2.mov"
	install -Dm644 b3-3.mov "${pkgdir}/opt/ATV4/b3-3.mov"
	install -Dm644 b4-1.mov "${pkgdir}/opt/ATV4/b4-1.mov"
	install -Dm644 b4-2.mov "${pkgdir}/opt/ATV4/b4-2.mov"
	install -Dm644 b4-3.mov "${pkgdir}/opt/ATV4/b4-3.mov"
	install -Dm644 b5-1.mov "${pkgdir}/opt/ATV4/b5-1.mov"
	install -Dm644 b5-2.mov "${pkgdir}/opt/ATV4/b5-2.mov"
	install -Dm644 b5-3.mov "${pkgdir}/opt/ATV4/b5-3.mov"
	install -Dm644 b6-1.mov "${pkgdir}/opt/ATV4/b6-1.mov"
	install -Dm644 b6-2.mov "${pkgdir}/opt/ATV4/b6-2.mov"
	install -Dm644 b6-3.mov "${pkgdir}/opt/ATV4/b6-3.mov"
	install -Dm644 b6-4.mov "${pkgdir}/opt/ATV4/b6-4.mov"
	install -Dm644 b7-1.mov "${pkgdir}/opt/ATV4/b7-1.mov"
	install -Dm644 b7-2.mov "${pkgdir}/opt/ATV4/b7-2.mov"
	install -Dm644 b7-3.mov "${pkgdir}/opt/ATV4/b7-3.mov"
	install -Dm644 b8-1.mov "${pkgdir}/opt/ATV4/b8-1.mov"
	install -Dm644 b8-2.mov "${pkgdir}/opt/ATV4/b8-2.mov"
	install -Dm644 b8-3.mov "${pkgdir}/opt/ATV4/b8-3.mov"
	install -Dm644 b9-1.mov "${pkgdir}/opt/ATV4/b9-1.mov"
	install -Dm644 b9-2.mov "${pkgdir}/opt/ATV4/b9-2.mov"
	install -Dm644 b9-3.mov "${pkgdir}/opt/ATV4/b9-3.mov"
}

