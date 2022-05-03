# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-roboto-flex
pkgver=3.100
pkgrel=3
epoch=1
pkgdesc="Upgrades Roboto to become a more powerful typeface system"
arch=('any')
url="https://github.com/googlefonts/roboto-flex"
license=('custom:OFL')
source=("$url/releases/download/$pkgver/roboto-flex-fonts.zip"
        "$url/raw/main/OFL.txt")
sha256sums=('02e0f5db84e69f254958434269d83aa6057b06f3c2a21042bb81b1afe1a0c8c6'
            'b023c5d35f13b14327b1db316eb8660f9924edb1819906b97e2c7dfef1b683f0')

package() {
  cd roboto-flex-fonts/

  install -Dm644 fonts/variable/*.ttf "$pkgdir"/usr/share/fonts/TTF/RobotoFlex-VF.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ../OFL.txt
}
