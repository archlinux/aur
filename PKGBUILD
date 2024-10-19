# Maintainer: KillerBossOriginal
# Contributor:
pkgname=stayfree-desktop
pkgver=2.7.4
pkgrel=2
pkgdesc="Analytics to help you understand and control your pc usage, leading to less distractions and enhanced productivity."
arch=('x86_64')
url="https://stayfreeapps.com"
license=('unknown')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'uuid' 'libsecret')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/stayfree-app/desktop-releases/releases/download/v$pkgver/stayfree-linux-amd64.deb")
sha256sums_x86_64=('cbcded00bbebd4f56084e013fe326b6c7db4e9e96a2b8e115f3a94667c1c2b3b')
package() {
  bsdtar -xf "${srcdir}/stayfree-linux-amd64.deb" -C "${srcdir}"
  
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}