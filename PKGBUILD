# Maintainer: Angel Sartonev <a.sartonev at gmail dot com>

pkgname=otf-gfs-majuscule
pkgver=20110730
pkgrel=1
pkgdesc='Open Font Majuscule typefaces, provided by the Greek Font Society'
arch=(any)
url='http://www.greekfontsociety.gr/pages/gr_typefaces1.html'
license=('custom:OTF')
depends=('fontconfig' 'xorg-font-utils')
install='otf-gfs-majuscule.install'
source=('http://www.greekfontsociety.gr/GFS_AMBROSIA.zip'
        'http://www.greekfontsociety.gr/GFS_FLEISCHMAN.zip'
        'http://www.greekfontsociety.gr/GFS_EUSTACE.zip'
        'http://www.greekfontsociety.gr/GFS_NICEFORE.zip'
        'http://www.greekfontsociety.gr/GFS_JACKSON.zip'
        'http://www.greekfontsociety.gr/GFS_GARALDUS.zip'
        'http://www.greekfontsociety.gr/GFS_IGNACIO.zip')
md5sums=('891a6e880ca0ef06223eedfab7c0e035'
         'adcb048bdca18dd243c0337bdb0c5ecd'
         'b54eea11af83c569b861a17800fb1945'
         '02fcaf05448bb0df6696567975014132'
         '73d235051292e23bc807c71d8c951e6b'
         '7638996769c9162f0d8b8885c18af68f'
         'ec397b1199ca79404adec355eeb5c163')
build() {
  install -d $pkgdir/usr/share/fonts/OTF/
  install -Dm644 $srcdir/GFS*/*otf $pkgdir/usr/share/fonts/OTF/
  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -Dm644 $srcdir/GFS_AMBROSIA/OFL* $pkgdir/usr/share/licenses/$pkgname
}


# vim:set ts=2 sw=2 et:
