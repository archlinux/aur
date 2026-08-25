# Maintainer: Supernoxus <Snowflakes at gmx dot at>

_pkgname='vrc-video-cacher'
pkgname="${_pkgname}-bin"
pkgdesc='Local video cacher that fixes bot detection errors in VRChat Youtube Videos'
pkgver='2026.7.2'
pkgrel='1'
arch=('x86_64')
url='https://github.com/EllyVR/VRCVideoCacher'
depends=("dotnet-runtime-10.0")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://github.com/EllyVR/VRCVideoCacher/releases/download/${pkgver}/VRCVideoCacher")
sha256sums=('b1f66f2231bc6ec05d2af36c0c54944bfd3ad816b73befe469859ef357ee3b72')
options=('!strip')

package() {
  install -Dm 755 VRCVideoCacher "$pkgdir/usr/bin/VRCVideoCacher"
}
