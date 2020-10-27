# Maintainer: Maroš Grego <maros@grego.site>
pkgname=blades-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Blazing fast dead simple static site generator"
url="https://www.getblades.org"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("blades")
options=("strip")
source=("https://github.com/grego/blades/releases/download/v$pkgver/blades-$pkgver-x86_64.tar.gz")
sha256sums=("c74b8528eb8059207422332f4618f0cc46597bd6cc0f8ae16bb76739f9d5b249")

package() {
    install -Dm755 blades -t "$pkgdir/usr/bin/"
}
