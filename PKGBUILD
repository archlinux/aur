# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=picard-plugins-aux
pkgver=1.1
pkgrel=1
pkgdesc="additional plugins for MusicBrainz Picard"
arch=('any')
url="http://musicbrainz.org/doc/MusicBrainz_Picard/Plugins"
license=('GPL')
depends=('picard')
conflicts=('picard-plugins<1.1')
# removed due to crashes:
#https://raw.github.com/mineo/mbstuff/master/picard/plugins/cue.py
source=(
https://raw.github.com/mineo/mbstuff/master/picard/plugins/padded.py
https://raw.github.com/voiceinsideyou/creaps-picard-plugins/master/titlesort.py
https://raw.github.com/voiceinsideyou/creaps-picard-plugins/master/titleversion.py
https://raw.github.com/weisslj/picardplugins/master/f2k_rgscan.py
http://kalou.net/unix/picard/metaflac_rgscan.py
http://sites.google.com/site/tonyflaks/sidecar.py
https://raw.github.com/voiceinsideyou/picard/plugins/contrib/plugins/removeperfectalbums.py
https://raw.github.com/encukou/picard-plugins/master/autosave.py
https://raw.github.com/brianfreud/Picard-plugins/master/eq2.py
https://raw.github.com/brianfreud/Picard-plugins/master/ne2.py
https://raw.github.com/brianfreud/Picard-plugins/master/p.py
)
md5sums=('97c429234998c46d5ec1de0aa13eae8e'
         '1219e450a0eb04d78a5fb1c36ddd45e5'
         '05c7dbe8f0ff5fc8e634da7db7f700c7'
         'deb3dcba323915f6e18de8904c7d3cd8'
         'c9099bde340ae51d5d2cb908a8ffff24'
         '921a0ba1b5659470f907e2cfc2f72694'
         'c53be179a061dc97f56e00fea9b14bd2'
         '3a39b178261c50ad2cd1440657a168a1'
         'c4be2eceee00f72fc5c4e848d965b2ea'
         'db4100901c9b583140e8fe81bb4d324f'
         '3f4dad9583c7a5d935d009069c599a51')

build() {
  plugindir=${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins
  cd "$srcdir"
  mkdir -p $plugindir
  cp \
    padded.py \
    titlesort.py titleversion.py \
    f2k_rgscan.py metaflac_rgscan.py sidecar.py \
    removeperfectalbums.py autosave.py \
    eq2.py ne2.py p.py \
    $plugindir
}

# vim:set ts=2 sw=2 et:
