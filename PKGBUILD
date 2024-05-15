# Maintainer: Jenrikku (JkKU)

pkgname=firefox-extensions-shinigami-eyes-bin
pkgver=1.0.33
pkgrel=1
pkgdesc="Highlights transphobic/anti-LGBT and trans-friendly subreddits/facebook pages/groups with different colors."
url=https://github.com/shinigami-eyes/shinigami-eyes
arch=("any")
license=("MIT")
depends=('firefox')
source=("https://addons.mozilla.org/firefox/downloads/file/4035973/shinigami_eyes-$pkgver.xpi")
noextract=("${source##*/}")
sha256sums=('c2ef94a9303040c267202505fd7aff311f6a945b0127be49c55a8b46c8f96db2')

package() {
    install -Dm644 "${source##*/}" "$pkgdir/usr/lib/firefox/browser/extensions/shinigamieyes@shinigamieyes.xpi"
}
