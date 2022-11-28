# Maintainer: hertg <aur@her.tg>
# This file is generated automatically
_version=v0.2.0
_pkgname=lightdm-theme-neon-bin
_pkgver=v0.2.0
_sha256sum=e43eca129fc037b18d011566188700393f4986f9ee25284a12263468a0b9e754
_source=${_pkgname}-${_pkgver}::https://github.com/hertg/lightdm-neon/releases/download/v0.2.0/build.tar.gz
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