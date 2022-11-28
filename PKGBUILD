# Maintainer: hertg <aur@her.tg>
# This file is generated automatically
_version=v0.2.0-rc.5
_pkgname=lightdm-theme-neon-bin
_pkgver=v0.2.0.rc.5
_sha256sum=9b663f65d773ffc3a8520c347bbc945ec7fe4d6db6e7090d6e493d21128d5517
_source=${_pkgname}-${_pkgver}::https://github.com/hertg/lightdm-neon/releases/download/v0.2.0-rc.5/build.tar.gz
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