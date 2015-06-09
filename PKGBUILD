pkgname=cue2tracks
pkgver=0.2.16
pkgrel=1
pkgdesc="Bash script for slipt audio CD image files with cue sheet"
url="https://code.google.com/p/cue2tracks/"
license=('GPL2')
arch=('any')
depends=('bash' 'cuetools' 'shntool' 'file' 'glibc' 'flac')
optdepends=('vorbis-tools: For OGG support'
'flake: Alternative FLAC encoder'
'mac: For APE support'
'wavpack: For WavPack support'
'shorten: For shorten support'
'ttaenc: For True Audio Codec support'
'lame: For MP3 support'
'id3v2: For MP3 tagging support'
'faac: For AAC in M4A support'
'faad: For AAC in M4A support')
source=("https://cue2tracks.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")

package() {
  cd $srcdir/$pkgname-$pkgver
	
  install -d -m 755 $pkgdir/usr/bin
  
  make install PREFIX="$pkgdir/usr"
}


md5sums=('f449aa804e8c3f9dd90a03f89f408fcc')
