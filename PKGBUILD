# Maintainer: Benjamin Asbach <archlinux-aur.${pkgname}@impl.it>

debname=zencash-desktop-gui-wallet
pkgname=zencash-swing-wallet-ui-bin
pkgver=0.83.2
pkgrel=1
pkgdesc="Desktop GUI Wallet for ZenCash"
arch=('any')
url="https://github.com/ZencashOfficial/zencash-swing-wallet-ui"
license=('MIT')
depends=('zencash' 'java-runtime')
source=("https://zencashofficial.github.io/repo/pool/main/z/zencash-desktop-gui-wallet/"$debname"_"$pkgver"_all.deb")

sha512sums=('5559a4e1a5efac319ba945e26f3f3e7025bd557b1b9caafdb7e2c9c59a8b72a3f420c61da9dedea4b9a4ad683359ff28d4d8d22a0a7f4cc297cbf066a1596a12')

build() {
  cd "$srcdir"
  tar -zxvf data.tar.gz
}

package() {
  cd "$srcdir"
  cp -r usr "${pkgdir}"
}
