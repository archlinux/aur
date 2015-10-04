# Maintainer: Sibren Vasse <arch @ sibrenvasse dot nl>
# Contributor: Preston Carpenter <APragmaticPlace@gmail.com>

pkgname=spotify-adkiller
source=("spotify-adkiller::git+http://github.com/SecUpwN/Spotify-AdKiller#branch=master")
url="https://github.com/SecUpwN/Spotify-AdKiller"
pkgver=10
pkgrel=1
epoch=0
pkgdesc="Your Party with Spotify - but without ads!"
arch=('any')
makedepends=('git')
license=('GPL3')
depends=("xorg-xprop" "libpulse" "libnotify" "pulseaudio")
md5sums=('SKIP')

package() {
    install -Dm755 "$srcdir"/"$pkgname"/spotify-adkiller.sh "$pkgdir"/usr/bin/spotify-adkiller.sh
    install -Dm755 "$srcdir"/"$pkgname"/spotify-wrapper.sh "$pkgdir"/usr/bin/spotify-wrapper.sh
    install -Dm644 "$srcdir"/"$pkgname"/"Spotify (AdKiller).desktop" "$pkgdir"/usr/share/applications/"Spotify (AdKiller).desktop"
}
