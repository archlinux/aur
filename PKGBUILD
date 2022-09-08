# Maintainer: ismailkarsli <ismail at karsli dot net>

pkgname=wallpaperflix
pkgver=0.0.1
pkgrel=1
pkgdesc="Automatic wallpaper downloader of posters of your favorite movies and TV shows via TMDb."
arch=("x86_64")
url="https://github.com/ismailkarsli/wallpaperflix"
license=("MIT")
depends=("libappindicator-gtk3" "webkit2gtk")
source=("https://github.com/ismailkarsli/wallpaperflix/releases/download/v${pkgver}/wallpaper-flix_${pkgver}_amd64.deb")
sha256sums=("0e227345a45eafbd419ac129e44f1f4ed45efcebe821ecc58fca823a3354607b")

package() {
	cd "$srcdir"
	bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}

