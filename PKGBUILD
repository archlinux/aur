#! /bin/sh
# Contributor:  <Jorge Barroso jorge.barroso.11 at gmail dot com>
 
 pkgname=aasaver
 pkgver=0.3.2
 pkgrel=4
 pkgdesc="A kde screensaver featuring aquarium/sea animation in ASCII art"
 arch=('i686' 'x86_64')
 url="http://www.kde-look.org/content/show.php/KDE+Asciiquarium?content=29207"
 license=('GPL')
 depends=(kdelibs qt3 python)
 source=("http://kde-look.org/content/download.php?content=29207&id=1&tan=37657884")
 sha512sums=('3960fed79f4ad124fb85a22ff00f187168a38cc68d0a44eb1b9149db4cd85a57f2e86cbd8dbe29e7f20f2ff429959ddf96ae027b52589b73b7df6d030db27b0d')

 build() {
   cd "$srcdir/$pkgname-$pkgver"

     ./configure
     make
        }
 package() {
     make DESTDIR="$pkgdir/opt/kde" install
         }
