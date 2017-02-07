# Contributor: 3ED <krzysztof1987@gmail.com>
pkgname=ape2mp3
pkgver=0.1
# notfound v0.2 in sf.net (showfiles)
pkgrel=3
pkgdesc="converts ape-image to mp3-tracks"
# idtags works?
arch=('any')
url="http://sourceforge.net/projects/ape2mp3/"
license=('GPL')
depends=('mac' 'lame' 'bchunk')
# change: depends-list is shorter
source=(http://downloads.sf.net/$pkgname/$pkgname)
md5sums=('30c5003a3a5abe461d8821d4aec1e8a4')

build() {
install -D -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

#$cat=multimedia
