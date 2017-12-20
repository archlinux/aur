# Maintainer: Benjamin Asbach <archlinux-aur.${pkgname}@impl.it>

debname=zencash-desktop-gui-wallet
pkgname=zencash-swing-wallet-ui-bin
pkgver=0.75.3
pkgrel=2
pkgdesc="Desktop GUI Wallet for ZenCash"
arch=('any')
url="https://github.com/ZencashOfficial/zencash-swing-wallet-ui"
license=('MIT')
depends=('zencash' 'java-runtime')
source=("https://zencashofficial.github.io/repo/pool/main/z/zencash-desktop-gui-wallet/"$debname"_"$pkgver"_all.deb")

sha512sums=('e49796f6fe4ed6cb3247d6c642c899b1e2be43ec5dc718500addeb420c73645c9d78d3baa3c4e8f329ad333ff9de25374cec575b827cc8ea927b4410dbe868c7')

build() {
  cd "$srcdir"
  tar -zxvf data.tar.gz
}

package() {
  cd "$srcdir"
  cp -r usr "${pkgdir}"
}
