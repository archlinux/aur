
# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname=plasma5-applet-video-wallpaper
pkgver=VERSION
pkgver=0.1
pkgrel=1
pkgdesc="Video wallpaper is a KDE plasma wallpaper / lock screen background plugin to play video files as background."
arch=('x86_64')
url="https://store.kde.org/p/1213488/"
license=('GPL')
depends=('plasma-desktop')
makedepends=('kpackage')
source=("VideoWallpaper.tar.gz::https://store.kde.org/p/1213488/startdownload?file_id=1518274191&file_name=VideoWallpaper.tar.gz&file_type=application/x-gzip&file_size=6505&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownloadfile%2Fid%2F1518274191%2Fs%2F6d4fe144dcaf4d6be345752e8e87b871%2Ft%2F1533750931%2Fu%2F%2FVideoWallpaper.tar.gz")
noextract=("${source[@]##*/}")
md5sums=('e20d978247ba748bc2f6759fa3a96269')



package() {
    # remove the previous version
    rm -rf /home/simon/.local/share/plasma/wallpapers/VideoWallpaper
    #installing the plugin
    kpackagetool5 -t Plasma/Wallpaper -i VideoWallpaper.tar.gz;
}
