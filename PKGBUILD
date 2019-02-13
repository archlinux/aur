
# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname=plasma5-applet-video-wallpaper
pkgver=0.1
pkgrel=4
pkgdesc="Video wallpaper is a KDE plasma wallpaper / lock screen background plugin to play video files as background."
arch=('x86_64')
url="https://store.kde.org/p/1213488/"
license=('GPL')
depends=('plasma-desktop')
source=("https://store.kde.org/p/1213488/startdownload?file_id=1518274191&file_name=VideoWallpaper.tar.gz&file_type=application/x-gzip&file_size=6505")
md5sums=('de616ba3849ae7d56983c73167ce4120')



package() {
    cd ${srcdir};
    
    install -dm755 ${pkgdir}/usr/share/plasma/wallpapers/VideoWallpaper/;
	cp -dr --no-preserve=ownership VideoWallpaper/* ${pkgdir}/usr/share/plasma/wallpapers/VideoWallpaper/;
}
