# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=('php-musicbrainz')
_pkgname=MusicBrainz
pkgver=0.2.2
pkgrel=1
pkgdesc="PHP library to access MusicBrainz's Web Service v2"
arch=('any')
url="https://github.com/mikealmond/MusicBrainz"
license=('MIT')
depends=('php>=5.3.8')
optdepends=(
'guzzle: for the GuzzleHttpAdapter'
'php-requests: for the RequestsHttpAdapter'
)

source=(https://github.com/mikealmond/$_pkgname/archive/v$pkgver.tar.gz)
sha256sums=('ee53a5dd0f20a30ab86388523ac16c57af5d507afa93478577eda388463ed027')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/pear/
  cp -r src/MusicBrainz $pkgdir/usr/share/pear/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp LICENSE.md $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
