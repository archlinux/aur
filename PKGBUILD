# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=picard-plugins-search
pkgver=1.0
pkgrel=1
pkgdesc="search plugins for MusicBrainz Picard"
arch=('any')
url="http://musicbrainz.org/doc/MusicBrainz_Picard/Plugins"
license=('GPL')
depends=('picard')
source=(
https://raw.github.com/brianfreud/Picard-plugins/master/SearchAMG.py
https://raw.github.com/brianfreud/Picard-plugins/master/SearchAmazon3.py
https://raw.github.com/brianfreud/Picard-plugins/master/SearchCastAlbums3.py
https://raw.github.com/brianfreud/Picard-plugins/master/SearchDiscogs3.py
https://raw.github.com/brianfreud/Picard-plugins/master/SearchEbay.py
https://raw.github.com/brianfreud/Picard-plugins/master/SearchFilmMusziek3.py
https://raw.github.com/brianfreud/Picard-plugins/master/SearchGMR.py
https://raw.github.com/brianfreud/Picard-plugins/master/SearchGoogle3.py
https://raw.github.com/brianfreud/Picard-plugins/master/SearchLortelArchives3.py
https://raw.github.com/brianfreud/Picard-plugins/master/SearchSoundtrackCollector3.py
https://raw.github.com/brianfreud/Picard-plugins/master/SearchSoundtrackINFO3.py
)
md5sums=('4b016bbeb194d6848a79c26a5ad8173b'
         '4335318cafb9061b32f91c8457bca876'
         '121540b38278e548a2daae9700cfd9fd'
         '26ed2e6f454422e7f852454105b5a330'
         '27736972127cd8c776455488392117dd'
         'e5c1f7759c4bfd63e9c35cfb93a150d6'
         '2d3d4b2ff969e6cd8fc7b270bac92201'
         '970f302d3e90d798370e0d2e35f4389c'
         '86f2bf4f8f25d3729d3175de25e9dd97'
         'b7e0d09c6419fe1c179507ecc1c4ed1d'
         '75b8c732caeae545d439cd916b8416ac')

build() {
  plugindir=${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins
  cd "$srcdir"
  mkdir -p $plugindir
  cp  SearchAMG.py SearchAmazon3.py SearchCastAlbums3.py SearchDiscogs3.py \
    SearchEbay.py SearchFilmMusziek3.py SearchGMR.py SearchGoogle3.py \
    SearchLortelArchives3.py SearchSoundtrackCollector3.py \
    SearchSoundtrackINFO3.py \
    $plugindir
}

# vim:set ts=2 sw=2 et:
