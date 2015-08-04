# Maintainer: Antonis G. <capoiosct at gmail dot com>
# Contributor: Apostolos Bessas <mpessas at gmail dot com>

pkgname=otf-gfs
pkgver=20140419
pkgrel=1
pkgdesc='Selection of open type fonts from the Greek Font Society.'
arch=(any)
url='http://www.greekfontsociety.gr/pages/gr_typefaces1.html'
license=('custom')
makedepends=(unzip)
depends=()
install='otf-gfs.install'
source=('http://www.greekfontsociety.gr/GFS_DIDOT_OT.zip'
        'http://www.greekfontsociety.gr/GFS_BODONI_OT.zip'
        'http://www.greekfontsociety.gr/GFS_OLGA_OT.zip'
        'http://www.greekfontsociety.gr/GFS_NEOHELLENIC_OT.zip'
        'http://www.greekfontsociety.gr/GFS_ARTEMISIA_OT.zip'
        'http://www.greekfontsociety.gr/GFS_THEOKRITOS_OT.zip'
        'http://www.greekfontsociety.gr/GFS_ELPIS_OT.zip'
        'http://www.greekfontsociety.gr/GFS_PYRSOS.zip'
        'http://www.greekfontsociety.gr/GFS_DIDOTCLASS_OT.zip'
        'http://www.greekfontsociety.gr/GFS_Porson_OT.zip'
        'http://www.greekfontsociety.gr/GFS_SOLOMOS_OT.zip'
        'http://www.greekfontsociety.gr/GFS_DECKER.zip'
        'http://www.greekfontsociety.gr/GFS_PHILOSTRATOS.zip'
        'http://www.greekfontsociety.gr/GFS_GOSCHEN.zip'
        'http://www.greekfontsociety.gr/GFS_BODONICLASS_OT.zip'
        'http://www.greekfontsociety.gr/GFS_BASKERVILLE_OT.zip'
        'http://www.greekfontsociety.gr/GFS_GAZIS.zip'
        'http://www.greekfontsociety.gr/GFS_COMPLUTUM_OT.zip')
md5sums=('b8fc2ea74d518c1254020ecec6f9cdc2'
         '25b4e0ea7a9c02c87b99f1a7f95cf250'
         'c7310eaf8445d9cd2758d0e88bed7e58'
         'c6fb13b64a905186c2d406445d489422'
         'e070b2cbb62b3135da2363a233a92abb'
         'c557a9e9e366b938d4c85ef15059b868'
         'b099427d71fdccb23820e386be8ccbd7'
         'ad4bce50a20830c93bc6e4437f674e95'
         '28b890ca211c17a1fadb0760eee4c246'
         'a06cbd0d75493dcff0986b5f70818873'
         '0c63e5ce5d1949d7ea98cf99baa53096'
         'b2b4c8db6c51a7db93d614b29387ac42'
         '81dedf8a53a2b0404a097c9504ebe19b'
         '561eb499d90c5ba3606c9f4b5ed75f09'
         'a581c49e12f5feed39c56135b47a2f55'
         '0013531c2da40d71e1743b19cef290ee'
         'a4c893f33da31e6152b5bd06c516b52d'
         'b6857e9252be1141ad48276c7fc0a6b0')
noextract=(${source[@]##*/})

build() {
  cd "$srcdir"
  unzip GFS_DIDOT_OT.zip
  unzip GFS_BODONI_OT.zip
  unzip GFS_OLGA_OT.zip
  unzip GFS_NEOHELLENIC_OT.zip
  unzip GFS_ARTEMISIA_OT.zip
  unzip GFS_THEOKRITOS_OT.zip
  unzip GFS_ELPIS_OT.zip
  unzip GFS_PYRSOS.zip
  unzip GFS_DIDOTCLASS_OT.zip
  unzip GFS_Porson_OT.zip
  unzip GFS_SOLOMOS_OT.zip
  unzip GFS_DECKER.zip
  unzip GFS_PHILOSTRATOS.zip
  unzip GFS_GOSCHEN.zip
  unzip GFS_BODONICLASS_OT.zip
  unzip GFS_BASKERVILLE_OT.zip
  unzip GFS_GAZIS.zip
  unzip GFS_COMPLUTUM_OT.zip
}

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/fonts/OTF/
  install -Dm644 $srcdir/GFS*/*otf $pkgdir/usr/share/fonts/OTF/
  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -Dm644 $srcdir/GFS_ARTEMISIA/OFL* $pkgdir/usr/share/licenses/$pkgname 
}


# vim:set ts=2 sw=2 et:
