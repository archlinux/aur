# Maintainer: diedbydisgust <sergio.cabrerafalcon@gmail.com>
pkgname=kodi-plugin-video-picta-bin
pkgver=v2.1.0
pkgrel=1
pkgdesc="Kodi mediacenter video plugin for picta.cu"
_gitname=oleksis/plugin.video.picta
_gitpkg=plugin.video.picta-kodi_19
arch=('x86_64')
url="https://github.com/oleksis/plugin.video.picta"
license=('MIT')
groups=('kodi')
provides=('kodi-plugin-video-picta')
makedepends=('unzip')
depends=('python-requests' 'kodi-addon-inputstream-adaptive' 'kodi-addon-inputstream-ffmpegdirect')
source=("https://github.com/$_gitname/releases/download/$pkgver/$_gitpkg.zip")

sha256sums=('256821af92327439103f53259c81b27882411a10b94323d937b86c7f4d2db9bb')

package() {
    mkdir -p $pkgdir/usr/share/kodi/addons
    unzip -qqu $srcdir/$_gitpkg.zip -d $pkgdir/usr/share/kodi/addons
}
