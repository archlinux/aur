# Maintainer: KillerBossOriginal
# Contributor:
pkgname=stayfree-desktop
pkgver=2.7.8
pkgrel=3
pkgdesc="Analytics to help you understand and control your pc usage, leading to less distractions and enhanced productivity."
arch=('x86_64')
url="https://stayfreeapps.com"
license=('unknown')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'uuid' 'libsecret')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/stayfree-app/desktop-releases/releases/download/v$pkgver/stayfree-linux-amd64.deb")
sha256sums_x86_64=('76b661819324d9f4325313dc51a2b7b88fcfe4d3c03bf7666bec43d4a2b36cb3')
package() {
  bsdtar -xf "${srcdir}/stayfree-linux-amd64.deb" -C "${srcdir}"
  
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}