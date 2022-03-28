# Maintainer: Jordan Day < jordanday444 at gmail dot com > 
# Contributor: Pierre Carru <pierre@carru.fr>

pkgname=inspect
pkgdesc='Developer tool to inspect and debug mobile web apps and websites on iOS devices'
pkgver=0.8.0
pkgrel=1
arch=('x86_64')
url='https://inspect.dev'
license=('proprietary')
depends=('libimobiledevice')
source=("https://github.com/inspectdev/inspect-release/releases/download/v${pkgver}/Inspect-${pkgver}-linux-amd64.deb")
sha256sums=('06087a0745c789c05c223197da03c8c5ac723cf4e79ac4f310394225b716825b')

prepare() {
  bsdtar -x -f data.tar.xz
}

package() {
  cp -rv usr opt $pkgdir/
}
