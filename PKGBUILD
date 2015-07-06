 # Contributor: realitygaps <realitygaps AT yahoo DOT com>
 pkgname=yoump3
 pkgver=0.1
 pkgrel=1
 pkgdesc="Ruby script to convert youtube videos to mp3 - Experimental"
 arch=(any)
 url="http://gplsystems.com"
 license=(GPL)
 depends=(ruby youtube-dl ffmpeg)
 makedepends=(rubygems ruby-parseconfig ruby-youtube-g)
 source=('http://gpljobs.com/yoump3'
	'http://gpljobs.com/yoump3.conf')

 noextract=('yoump3'
	'yoump3.conf')
 md5sums=('4dd2f745a1d65b4a58c942b46f1ff173'
	'b9da64394012feeb2f71c543336a1e0d')
 
 build() {
   cd $srcdir
   mkdir -p $pkgdir/usr/bin
   mkdir -p $pkgdir/etc
   cp yoump3 $pkgdir/usr/bin/
   cp yoump3.conf $pkgdir/etc/
   chmod a+x $pkgdir/usr/bin/yoump3
 }

