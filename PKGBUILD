# Contributor: Cauã Alvarenga Neves <cauaalvarenganeves@gmail.com>
# Contributor: tee < teeaur at duck dot com >

_pkgname=swingmusic
pkgname="$_pkgname-bin"
pkgver=2.1.4
pkgrel=1
pkgdesc="Swing Music is a beautiful, self-hosted music player for your local audio files. Like a cooler Spotify ... but bring your own music."
arch=('x86_64')
url="https://swingmx.com"
license=('MIT')
depends=()
provides=('swingmusic')
conflicts=('swingmusic-beta-bin' 'swingmusic')
optdepends=('ffmpeg: audio silence skip feature')
source=("https://raw.githubusercontent.com/swingmx/swingmusic/refs/tags/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver::https://github.com/swingmx/swingmusic/releases/download/v$pkgver/swingmusic_linux_$arch")
sha256sums=('30b0f446384bbda0c6d6b8ca0655e3fe76194828ec4065a9ffffe876c8944fda')
sha256sums_x86_64=('c300a9b325a88f84827b954e496b6989f3f00b7ab39301c854926139859b8354')

package() {
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
