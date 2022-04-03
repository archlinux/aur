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
sha256sums=('5f4af4693b07a9e0972ae30b1da80b17bf097dc92e4adb38cf0ebd46e3603e9d')

prepare() {
  bsdtar -x -f data.tar.xz
}

package() {
  cp -rv usr opt $pkgdir/
}
