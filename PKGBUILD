# Maintainer: ismailkarsli <ismail at karsli dot net>

pkgname=wallpaperflix
pkgver=0.0.2
pkgrel=1
pkgdesc="Automatic wallpaper downloader of posters of your favorite movies and TV shows via TMDb."
arch=("x86_64")
url="https://github.com/ismailkarsli/wallpaperflix"
license=("MIT")
depends=("libappindicator-gtk3" "webkit2gtk")
source=("https://github.com/ismailkarsli/wallpaperflix/releases/download/v${pkgver}/wallpaper-flix_${pkgver}_amd64.deb")
sha256sums=("7778c09c55959092df9fce453ca70c96cc5acf83033625c4de3372a1b1e3cc2a")

package() {
	cd "$srcdir"
	bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}

