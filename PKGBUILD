# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=ttf-sourcesanspro
pkgver=20171219
_gitver=5f860df52f1f37108203c4b7a10d9e4e1aa5199d
pkgrel=2
pkgdesc="Google Fonts Source Sans Pro"
arch=('any')
license=('Apache')
url="http://www.google.com/fonts/specimen/Open+Sans"
source=(https://github.com/google/fonts/raw/$_gitver/ofl/sourcesanspro/SourceSansPro-{Black,BlackItalic,Bold,BoldItalic,ExtraLight,ExtraLightItalic,Italic,Light,LightItalic,Regular,SemiBold,SemiBoldItalic}.ttf)
md5sums=('e495a7368e5f4d3c155daf129b841378'
         'adaf9bf8364b3101b1bcb73ec6794c5c'
         '0d9b62a03206f739cd34b2936a5929f1'
         '9950e9ec3672c65b4e64bfb5b562131a'
         'fd04b68bcc43c5b7aabb44c5386c3542'
         '32305eb04569512ab9b7340aa8c10a5d'
         '764c2cc5318c856dfccb29cd8529b51d'
         'ee2a11b8055d665afd2ac1d818683ffe'
         'eb5d8127e4158c7241a10cc05de930f6'
         '5182da425f811908bed9f5b8c72fa44f'
         '774c05ccae92d11b95a2ef722c9566a8'
         '0f3a2e37b81162b12c9fa35455540231')

package() {
  cd $srcdir

  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 $srcdir/SourceSansPro*.ttf $pkgdir/usr/share/fonts/TTF
}
