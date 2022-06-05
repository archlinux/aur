# Maintainer: Jordan Day < jordanday444 at gmail dot com > 
# Contributor: Pierre Carru <pierre@carru.fr>

pkgname=inspect
pkgdesc='Developer tool to inspect and debug mobile web apps and websites on iOS devices'
pkgver=0.8.2
pkgrel=1
arch=('x86_64')
url='https://inspect.dev'
license=('proprietary')
depends=('libimobiledevice')
source=("https://github.com/inspectdev/inspect-release/releases/download/v${pkgver}/Inspect-${pkgver}-linux-amd64.deb")
sha256sums=('d7760cedad6cb240ee18e473e59b14e0befa44688ee8e2a3c41b3792db0f3c85')

prepare() {
  bsdtar -x -f data.tar.xz
}

package() {
  cp -rv usr opt $pkgdir/
}
