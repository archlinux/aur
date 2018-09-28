## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-embedded
_debpkgver=4.5.0-18_amd64
pkgver=4.5.0
pkgrel=1
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/custom.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'flac' 'gcc-libs' 'libgmpris' 'glib2' 'rygel')
source=("https://www.signalyst.eu/bins/hqplayerd/bionic/hqplayerd_$_debpkgver.deb" 'hqplayerd.service')
sha256sums=('SKIP'
'5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a')

package() {
  bsdtar xf data.tar.xz -C "$srcdir"
  
      install -Dm755 "$srcdir/usr/bin/hqplayerd" \
    "$pkgdir/usr/bin/hqplayerd"
    
      install -Dm755 "$srcdir/usr/bin/start-uac-gadget.sh" \
    "$pkgdir/usr/bin/start-uac-gadget.sh"
    
     install -Dm644 "$srcdir/etc/hqplayer/hqplayerd.xml" \
    "$pkgdir/etc/hqplayer/hqplayerd.xml"
    
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/readme.txt.gz" \
    "$pkgdir/usr/share/doc/hqplayerd/readme.txt.gz"
    
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/rygel.conf.gz" \
    "$pkgdir/usr/share/doc/hqplayerd/rygel.conf.gz"
    
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/hqplayerd.xml-rme.gz" \
    "$pkgdir/usr/share/doc/hqplayerd/hqplayerd.xml-rme.gz"
    
      install -Dm644 "$srcdir/usr/share/doc/hqplayerd/hqplayerd.xml-uac2" \
    "$pkgdir/usr/share/doc/hqplayerd/hqplayerd.xml-uac2"
  
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    
     install -Dm644 "hqplayerd.service" \
    "$pkgdir/usr/lib/systemd/user/hqplayerd.service"
    
      install -Dm644 "$srcdir/var/hqplayer/web/default-cover.png" \
    "$pkgdir/var/hqplayer/web/default-cover.png"
    
     install -Dm644 "$srcdir/var/hqplayer/web/default.css" \
    "$pkgdir/var/hqplayer/web/default.css"
    
     install -Dm644 "$srcdir/var/hqplayer/web/favicon.ico" \
    "$pkgdir/var/hqplayer/web/favicon.ico"
    
     install -Dm644 "$srcdir/var/hqplayer/web/next.svg" \
    "$pkgdir/var/hqplayer/web/next.svg"
    
     install -Dm644 "$srcdir/var/hqplayer/web/pause.svg" \
    "$pkgdir/var/hqplayer/web/pause.svg"
    
     install -Dm644 "$srcdir/var/hqplayer/web/play.svg" \
    "$pkgdir/var/hqplayer/web/play.svg"
    
     install -Dm644 "$srcdir/var/hqplayer/web/prev.svg" \
    "$pkgdir/var/hqplayer/web/prev.svg"
    
     install -Dm644 "$srcdir/var/hqplayer/web/queue.svg" \
    "$pkgdir/var/hqplayer/web/queue.svg"
    
      install -Dm644 "$srcdir/var/hqplayer/web/stop.svg" \
    "$pkgdir/var/hqplayer/web/stop.svg"
}
