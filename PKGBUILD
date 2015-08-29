# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=space-bg
pkgver=2.0.7
pkgrel=2
pkgdesc="A background image setting program that grabs the daily astronomy image (http://apod.nasa.gov/apod/astropix.html)"
arch=('any')
license=('GPL')
url='http://github.com/t0nedef/space-bg'
groups=()
depends=('hsetroot' 'python-beautifulsoup4' 'libnotify' 'wget' 'youtube-dl' 'mplayer' 'vimeo-dl-git' 'imagemagick')
source=("https://github.com/t0nedef/space-bg/archive/${pkgver}.tar.gz")
package()
{
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm755 spacesetbg ${pkgdir}/usr/bin/spacesetbg
	install -Dm755 spacevideo.sh ${pkgdir}/usr/bin/spacevideo.sh
	install -Dm644 spaceimg.py ${pkgdir}/usr/lib/python3.4/site-packages/spaceimg.py
}
#
md5sums=('0d93963b0d0e1a7ce04eec1a64021bf2')
