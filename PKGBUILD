# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>
# Contributor: jpe90 <patriot.game@gmail.com>
pkgname='ttf-permanent-marker'
pkgver=1.0.0
pkgrel=2
pkgdesc='handwritten-style font by Font Diner'
arch=(any)
url="git+https://github.com/google/fonts.git"
license=(OFL)
depends=('fontconfig')
source=("https://github.com/google/fonts/blob/main/apache/permanentmarker/LICENSE.txt"
"https://github.com/google/fonts/blob/main/apache/permanentmarker/PermanentMarker-Regular.ttf")
sha512sums=('5826ab9a5666c99f5c546092373fe738aa02c68c36264b4b1b07ee2a29137e5a765d7ff18c83e787c077a9c58a71b0f93fd4acaca29b09ef116d602357bfd8d3'
            '2f22f0c9d64f11de27a5ec4f3b77ee1d37792774c4be48dce43780fbe5df695497655751099417f7cdf9fbc2f27444b8f3555c40ced3f6940c28099050f2b2bf')

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" PermanentMarker-Regular.ttf
}
