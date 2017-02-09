# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=ttf-sourcesanspro
pkgver=20140702
_hgver=3f5f3dc20e70
pkgrel=1
pkgdesc="Google Fonts Source Sans Pro"
arch=('any')
license=('Apache')
url="http://www.google.com/fonts/specimen/Open+Sans"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(https://github.com/google/fonts/raw/master/ofl/sourcesanspro/SourceSansPro-{Black,BlackItalic,Bold,BoldItalic,ExtraLight,ExtraLightItalic,Italic,Light,LightItalic,Regular,Semibold,SemiboldItalic}.ttf)
md5sums=('87dc85e3e9a6074a802e9e3d5838d492'
         '65a6a9b95d74e75505e768eb09cd3229'
         '5c6c404eca1aa7c5951e05d7f2cf40eb'
         'a9ab9bc7a4da7b1b4c07b703ba0588e4'
         '3bb60a8ae87f0819ee4a8641b2720a78'
         '664a123b9b8713bb118f306647cdac67'
         '46e0b6c05203ba6d552381c5ab4852bc'
         'b2e90cc01cdd1e2e6f214d5cb2ae5c26'
         '905fad59461f99951c168165296f8def'
         'ba6cad25afe01d394e830f548a7f94df'
         '52984b3a4e09652a6feee711d5c169fd'
         'bbc9013d157f3e38981d3aab8b1136af')

package() {
  cd $srcdir

  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 $srcdir/SourceSansPro*.ttf $pkgdir/usr/share/fonts/TTF
}
