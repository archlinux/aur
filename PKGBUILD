# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbry-sync-ytdl
_author=gardenappl
pkgver=1.8.2
pkgrel=1
pkgdesc='Sync content to LBRY using youtube-dl'
arch=('any')
url="https://gitlab.com/$_author/$pkgname"
license=('GPL3')
depends=('jq' 'curl' 'lbrynet')
makedepends=('perl')
optdepends=('youtube-dl: Standard youtube-dl' 'yt-dlp: Improved fork of youtube-dl')
source=("https://gitlab.com/$_author/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")

build() {
	make -C "$pkgname-v$pkgver"
}

package() {
	make DESTDIR="$pkgdir" -C "$pkgname-v$pkgver" install
}
sha256sums=('b4671cf21d2828bed5c71eae1247d8e722ca372847a7f5dea67854d6231f839f')
b2sums=('a356682303ffb9a8bb37f1ce26430db52ff6d9371fa0c14fd2b90bf070a52aaa61a3e160bc49c8d0c1d546f61d3f24d8c40ad992b4936a3f8f8d3a956ba08935')
