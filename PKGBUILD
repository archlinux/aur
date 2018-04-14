# Maintainer: Benjamin Asbach <archlinux-aur.${pkgname}@impl.it>

debname=zencash-desktop-gui-wallet
pkgname=zencash-swing-wallet-ui-bin
pkgver=0.80.3
pkgrel=1
pkgdesc="Desktop GUI Wallet for ZenCash"
arch=('any')
url="https://github.com/ZencashOfficial/zencash-swing-wallet-ui"
license=('MIT')
depends=('zencash' 'java-runtime')
source=("https://zencashofficial.github.io/repo/pool/main/z/zencash-desktop-gui-wallet/"$debname"_"$pkgver"_all.deb")

sha512sums=('0a2626dd4bfef7696872d727ef93ccd6e22db129af7b7d613b979693e9f5583ce655195e7e704442e575f805f24861a5d62f293b416db665276860070f3a5d9e')

build() {
  cd "$srcdir"
  tar -zxvf data.tar.gz
}

package() {
  cd "$srcdir"
  cp -r usr "${pkgdir}"
}
