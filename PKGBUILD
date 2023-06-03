# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=ttf-sourcesanspro
pkgver=20210915
_gitver=f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7
pkgrel=1
pkgdesc="Google Fonts Source Sans Pro"
arch=('any')
license=('Apache')
url="http://www.google.com/fonts/specimen/Open+Sans"
source=(https://github.com/google/fonts/raw/$_gitver/ofl/sourcesanspro/SourceSansPro-{Black,BlackItalic,Bold,BoldItalic,ExtraLight,ExtraLightItalic,Italic,Light,LightItalic,Regular,SemiBold,SemiBoldItalic}.ttf)
sha256sums=('51fb02911c19199d2b0b35789ef52b0179380e7294abaac93855bfd1b0b1b704'
            '0de64da2f8b859920cb60e8ea617274b9f1c9dba427773be61307d79c982204a'
            'e1ac971e7b62b2ad0b0bb9f55bc15f6215df8af5bf69e894905341cfdfa51aea'
            '0ad42cce23ed61aada9e6a156bfa411fd03354067711e04b3bb3c8470f82d8c6'
            '7a44c30e92eda0963633377ff584dd83505f56e65e6c118c5ca327190db42dcd'
            '609d64c048f49ffc52b5f1d6f4cd2f3f87840c0639b3564adaf2e47097a01ef3'
            '740798947aa0151c6bec4508ba73eb7cb22f9ef2e4354314fc638f66eaa2f072'
            '719319e7fe1ed06a6bc5e66a1cfea8c52250eefee502d175780cf4571ddc5bf0'
            '605425dc687ecc7bdce9329c0fc976ea38eb38a910c24144ced60d73f35e855e'
            '3d2e962599d4bd83b797ab813f2017f2c7f7e7e0e2e8e3a497f4e713a0b3c9c9'
            '37bb472f47d33a04f5616c6e9120723ed944c31306838ecd692feb7c69084da2'
            '8e1136c1c135261a389118f9758d477d3582c9dda10fec6b7511e27e866adfbc')

package() {
  cd $srcdir

  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 $srcdir/SourceSansPro*.ttf $pkgdir/usr/share/fonts/TTF
}
