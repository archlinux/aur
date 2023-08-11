# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>

pkgname=chainweaver
pkgver=2.2.3.0
pkgrel=1
pkgdesc="Official Kadena wallet for advanced blockchain usage and smart contract development. The desktop edition has a signing API to interact with dapps on Kadena Chainweb."
arch=('x86_64')
url="https://docs.kadena.io/basics/wallets"
#license=('MPL-2.0')

#TODO: depends=("gtk3" "libnotify" "nss" "libxtst" "xdg-utils" "at-spi2-core" "libdrm" "mesa" "libxcb" "gvfs" "glib2")
# the deps are not even listed in .deb package, I need to fix this in next pkgrel

source=("kadena-${pkgname}-linux-${pkgver}.deb::https://github.com/kadena-io/chainweaver/releases/download/v2.2.3/kadena-${pkgname}-linux-${pkgver}.deb")
# alternative aws source from wbsite
#source=("kadena-${pkgname}-linux-${pkgver}.deb::https://chainweaver-builds.s3.amazonaws.com/2.2.2/kadena-${pkgname}-linux-${pkgver}.deb")
b2sums=('33c04b732aae2ade15d7968dd5e8fc0abfcd3a8d1dcc2c50e4bdd6be66cb4bcbb0dc74f32c1e8731cfeb487b71339b8f8ca9f8c75a016068df02b87d03468bea')

package() {
  msg2 "Extracting the data.tar.xz"
  tar -xf data.tar.xz -C "${pkgdir}/"
}
