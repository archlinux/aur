# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=cue2tracks
pkgver=0.2.17
pkgrel=1
pkgdesc="Bash script for slipt audio CD image files with cue sheet"
url="https://github.com/ar-lex/cue2tracks"
license=('GPL2')
arch=('any')
depends=('bash' 'cuetools' 'shntool' 'file' 'glibc' 'flac')
optdepends=('vorbis-tools: For OGG support'
            'flake: Alternative FLAC encoder'
            'mac: For APE support'
            'wavpack: For WavPack support'
            'optimfrog: For OptimFROG support'
            'shorten: For shorten support'
            'lame: For MP3 support'
            'musepack-tools: For MusePack support'
            'ttaenc: For True Audio Codec support'
            'faac: For AAC in M4A support'
            'faad2: For AAC in M4A support'
            'tak: For TAK support'
            'id3v2: For MP3 tagging support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('f2c93a10cfdea99b1f58fad3a7f64a81')

package() {
 cd $srcdir/$pkgname-$pkgver
 make install PREFIX="$pkgdir/usr"
}
