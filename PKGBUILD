# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>

pkgname=chainweaver
pkgver=2.2.2.0
pkgrel=1
pkgdesc="Official Kadena wallet for advanced blockchain usage and smart contract development. The desktop edition has a signing API to interact with dapps on Kadena Chainweb."
arch=('x86_64')
url="https://docs.kadena.io/basics/wallets"
#license=('MPL-2.0')

#TODO: depends=("gtk3" "libnotify" "nss" "libxtst" "xdg-utils" "at-spi2-core" "libdrm" "mesa" "libxcb" "gvfs" "glib2")
# the deps are not even listed in .deb package, I need to fix this in next pkgrel

source=("kadena-${pkgname}-linux-${pkgver}.deb::https://github.com/kadena-io/chainweaver/releases/download/v2.2.2/kadena-${pkgname}-linux-${pkgver}.deb")
# alternative aws source from wbsite
#source=("kadena-${pkgname}-linux-${pkgver}.deb::https://chainweaver-builds.s3.amazonaws.com/2.2.2/kadena-${pkgname}-linux-${pkgver}.deb")
b2sums=('b20ffeddbc60322fc0b6566cff30459d00e54baed38efba4863f02c680810fd04ce9219b0d0478c75ca27fef521bb25c43e3956186c6f79ef7b3c061ff1b04ea')

package() {
  msg2 "Extracting the data.tar.xz"
  tar -xf data.tar.xz -C "${pkgdir}/"
}
