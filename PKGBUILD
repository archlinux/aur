# Maintainer: Jenrikku (JkKU)

pkgname=firefox-extensions-shinigami-eyes-bin
pkgver=1.0.33
pkgrel=2
pkgdesc="Highlights transphobic/anti-LGBT and trans-friendly subreddits/facebook pages/groups with different colors."
url=https://github.com/shinigami-eyes/shinigami-eyes
arch=("any")
license=("MIT")
depends=('firefox')
source=("https://addons.mozilla.org/firefox/downloads/file/4234849/shinigami_eyes-$pkgver.xpi")
noextract=("${source##*/}")
sha256sums=('5280d7679bfd8aaf1c847bfdbd85398d886181da007eddfa611d39a6fa7ec4a1')

package() {
    install -Dm644 "${source##*/}" "$pkgdir/usr/lib/firefox/browser/extensions/shinigamieyes@shinigamieyes.xpi"
}
