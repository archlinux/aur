# Maintainer: diedbydisgust <sergio.cabrerafalcon@gmail.com>
pkgname=kodi-plugin-video-picta-bin
pkgver=v2.0.0
pkgrel=1
pkgdesc="Kodi mediacenter video plugin for picta.cu"
_gitname=plugin.video.picta
_gitpkg=plugin.video.picta-kodi_19
arch=('x86_64')
url="https://github.com/oleksis/plugin.video.picta"
license=('MIT')
groups=('kodi')
provides=('kodi-plugin-video-picta')
makedepends=('unzip')
depends=('python-requests' 'kodi-addon-inputstream-adaptive' 'kodi-addon-inputstream-ffmpegdirect')
source=("https://github.com/oleksis/$_gitname/releases/download/$pkgver/$_gitpkg.zip")

sha256sums=('f2f20222a0776d2b49930e00d4f277345fa451ef5d587813999366ed90cf48e0')

package() {
    mkdir -p $pkgdir/usr/share/kodi/addons
    unzip -qqu $srcdir/$_gitpkg.zip -d $pkgdir/usr/share/kodi/addons
}
