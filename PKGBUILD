# Maintainer: Jordan Day < jordanday444 at gmail dot com > 
# Contributor: Pierre Carru <pierre@carru.fr>

pkgname=inspect
pkgdesc='Developer tool to inspect and debug mobile web apps and websites on iOS devices'
pkgver=0.7.9
pkgrel=1
arch=('x86_64')
url='https://inspect.dev'
license=('proprietary')
depends=('libimobiledevice')
source=("https://github.com/inspectdev/inspect-release/releases/download/v${pkgver}/Inspect-${pkgver}-linux-amd64.deb")
sha256sums=('6061ae7db99a5c9563fd4376366019cab9c07776185d17808d635f6c19f5488e')

prepare() {
  bsdtar -x -f data.tar.xz
}

package() {
  cp -rv usr opt $pkgdir/
}
