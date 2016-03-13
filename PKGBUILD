# Maintainer: Antonis G. <capoiosct at gmail dot com>
# Contributor: Apostolos Bessas <mpessas at gmail dot com>

pkgname=otf-gfs
pkgver=20160313
pkgrel=1
pkgdesc='Selection of open type fonts from the Greek Font Society.'
arch=(any)
url='http://www.greekfontsociety.gr/pages/gr_typefaces1.html'
license=('custom')
makedepends=('unzip')
depends=()
install='otf-gfs.install'


source=("http://www.greekfontsociety.gr/_assets/fonts/GFS_Pyrsos.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Orpheus_Sans.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Orpheus.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Elpis.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Theokritos.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Artemisia.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_NeoHellenic.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Olga.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Bodoni.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Didot_Display.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Didot.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Goschen.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Philostratos.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Orpheus_Classic.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Decker.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Solomos.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Porson.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Didot_Classic.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Gazis.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Baskerville.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Bodoni_Classic.zip"
	"http://www.greekfontsociety.gr/_assets/fonts/GFS_Complutum.zip")

md5sums=('ad4bce50a20830c93bc6e4437f674e95'
         'd6bfb548a31f352901b0a9ae77c7bbda'
         'e00e5af737e5e74ae7f17660718461af'
         'b099427d71fdccb23820e386be8ccbd7'
         'c557a9e9e366b938d4c85ef15059b868'
         '3cba29df7b102c10c1612f15d0b6b6d3'
         '2672799c089cc78212046e7effcd0b3b'
         'c37d6490a648ab987743c0878c9a423c'
         '2409b756a28631aae2912004c2a867e9'
         '55684035c46a240699d3d13b34c6affe'
         '7294978fb48cec9317d68d68378f2abb'
         '561eb499d90c5ba3606c9f4b5ed75f09'
         '81dedf8a53a2b0404a097c9504ebe19b'
         '88b2bac8272b0220c590163aa3a5bb00'
         'b2b4c8db6c51a7db93d614b29387ac42'
         '0c63e5ce5d1949d7ea98cf99baa53096'
         'b837d9b9945f67d6b88ab7572eb0a00c'
         '2a29df9769ce7b3be5d995aadb3283ab'
         'a4c893f33da31e6152b5bd06c516b52d'
         'a4f88fe7b6a598c5ed12f6c54dc03a8f'
         'a581c49e12f5feed39c56135b47a2f55'
         'b6857e9252be1141ad48276c7fc0a6b0')

noextract=(${source[@]##*/})

package() {
cd "$srcdir"

unzip GFS_Pyrsos.zip
unzip GFS_Orpheus_Sans.zip
unzip GFS_Orpheus.zip
unzip GFS_Elpis.zip
unzip GFS_Theokritos.zip
unzip GFS_Artemisia.zip
unzip GFS_NeoHellenic.zip
unzip GFS_Olga.zip
unzip GFS_Bodoni.zip
unzip GFS_Didot_Display.zip
unzip GFS_Didot.zip
unzip GFS_Goschen.zip
unzip GFS_Philostratos.zip
unzip GFS_Orpheus_Classic.zip
unzip GFS_Decker.zip
unzip GFS_Solomos.zip
unzip GFS_Porson.zip
unzip GFS_Didot_Classic.zip
unzip GFS_Gazis.zip
unzip GFS_Baskerville.zip
unzip GFS_Bodoni_Classic.zip
unzip GFS_Complutum.zip

install -d $pkgdir/usr/share/fonts/OTF/
install -Dm644 $srcdir/GFS*/*otf $pkgdir/usr/share/fonts/OTF/
install -d $pkgdir/usr/share/licenses/$pkgname/
install -Dm644 $srcdir/GFS_ARTEMISIA/OFL* $pkgdir/usr/share/licenses/$pkgname 
}
