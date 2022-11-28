# Maintainer: hertg <aur@her.tg>
# This file is generated automatically
_version=v0.2.0-rc.4
_pkgname=lightdm-theme-neon-bin
_pkgver=v0.2.0.rc.4
_sha256sum=2ff77373a5557091aa9da77c85fa8b90febda8f76835ed4d4017b208600f5834
_source=${_pkgname}-${_pkgver}.tar.gz::https://github.com/hertg/lightdm-neon/releases/download/v0.2.0-rc.4/build.tar.gz
pkgname=$_pkgname
pkgver=$_pkgver
pkgdesc='Modern and customizable theme for web-greeter with a nostalgic neon look'
pkgrel=1
arch=('any')
license=('GPL')
url='https://github.com/hertg/lightdm-neon'
makedepends=()
optdepends=()
provides=()
conflicts=()
source=($_source)
sha256sums=($_sha256sum)

package() {
  install -dm755 ${pkgdir}/usr/share/web-greeter/themes/neon
  cp -r ${srcdir}/public/. ${pkgdir}/usr/share/web-greeter/themes/neon
}
