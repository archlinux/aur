
# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname=plasma5-applet-video-wallpaper
pkgver=0.1
pkgrel=4
pkgdesc="Video wallpaper is a KDE plasma wallpaper / lock screen background plugin to play video files as background."
arch=('x86_64')
url="https://store.kde.org/p/1213488/"
license=('GPL')
depends=('plasma-desktop')
source=("https://www.opendesktop.org/p/1213488/startdownload?file_id=1518274191&file_name=VideoWallpaper.tar.gz&file_type=application/x-gzip&file_size=6505&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownloadfile%2Fid%2F1518274191%2Fs%2F20b7b4b186c5eb2fa1f52da51a994708%2Ft%2F1533768401%2Fu%2F%2FVideoWallpaper.tar.gz"
"makefile")
md5sums=('e20d978247ba748bc2f6759fa3a96269'
         'e474b1e27951b2aeef9380cc442517f1')



package() {
    cd VideoWallpaper;
        make DESTDIR="~/.local/share/" install;
}

prepare() {
    ln -t VideoWallpaper/ makefile;
}
