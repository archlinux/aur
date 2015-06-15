#! /bin/bash
#Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=kde-servicemenus-video-dl
pkgver=0.3.3
pkgrel=1
pkgdesc="Servicemenu for KDE to download videos and extract its audio"
arch=('any')
url="http://kde-apps.org/content/show.php/kde-service-menu-video-dl+?content=157943"
license=('GPL')
depends=("kdebase-workspace>=4.10.1" "mawk" "kde-servicemenus-youtube" "ffmpeg")
source=("https://kde-peace-settings.googlecode.com/git/kde-services-menu/kde-service-menu-video-dl/kde-service-menu-video-dl_0.3.3.tar.gz")

package(){
    
	cd ${srcdir}
	mkdir -p $pkgdir/usr
	cp -r usr/* $pkgdir/usr/
}

sha512sums=('4f21a1c8fd0d8ff6dc4e5b88c96da47834ab9955610c5173e50173977325e189cceb6b5382251ddf73618b1f963603824b8a97a79f111ddf8abe955b38da85e7')
