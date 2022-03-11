# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-roboto-flex
pkgver=3.002
pkgrel=1
epoch=1
pkgdesc="Upgrades Roboto to become a more powerful typeface system"
arch=('any')
url="https://github.com/googlefonts/roboto-flex"
license=('custom:OFL')
source=("$url/releases/download/$pkgver/roboto-flex-fonts.zip"
        "$url/raw/main/OFL.txt")
sha256sums=('645a0acec0f417a3cbe139a28b0d9ff350913cba3192f6817d9d062cbe3ab029'
            'b023c5d35f13b14327b1db316eb8660f9924edb1819906b97e2c7dfef1b683f0')

package() {
  cd roboto-flex-fonts/

  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 fonts/variable/*.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 $srcdir/OFL.txt
}
