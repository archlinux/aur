# Maintainer: Carlos Henrique Merces Moreira "chmercesmoreira" <ch.mercesmoreira@gmail.com>
pkgname=plexdrive
pkgver=5.0.0
pkgrel=6
pkgdesc="Plexdrive mounts your Google Drive FUSE filesystem (optimized for media playback)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/dweidenfeld/plexdrive"
license=('MIT')
depends=('fuse2')
source_i686=("https://github.com/dweidenfeld/"$pkgname"/releases/download/"$pkgver"/"$pkgname"-linux-386")
source_x86_64=("https://github.com/dweidenfeld/"$pkgname"/releases/download/"$pkgver"/"$pkgname"-linux-amd64")
source_arm=("https://github.com/dweidenfeld/"$pkgname"/releases/download/"$pkgver"/"$pkgname"-linux-arm5")
source_armv6h=("https://github.com/dweidenfeld/"$pkgname"/releases/download/"$pkgver"/"$pkgname"-linux-arm6")
source_armv7h=("https://github.com/dweidenfeld/"$pkgname"/releases/download/"$pkgver"/"$pkgname"-linux-arm7")
source_aarch64=("https://github.com/dweidenfeld/"$pkgname"/releases/download/"$pkgver"/"$pkgname"-linux-arm64")
md5sums_i686=('ad566b861397499b2bffc5e4ea036394')
md5sums_x86_64=('5ff225e47c72431c440c251d39c6d2ef')
md5sums_arm=('17d84966b994787afb7e8741a2a8f08a')
md5sums_armv6h=('611d9b2d6053dd8e8a33952b5e34c6e4')
md5sums_armv7h=('4d3691f0ab29dd2ce332d234130d4bfb')
md5sums_aarch64=('2af4d2b4596492c52dd0e0f88f542a81')

package () {
	install -Dm755 "$pkgname"-linux-* "$pkgdir/usr/bin/plexdrive"
}
