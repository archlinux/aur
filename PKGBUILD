# shellcheck disable=SC2181,SC2148,SC2034,SC2164,SC2154

pkgname=ttf-win81-fonts
pkgver=1.2
pkgrel=1
pkgdesc="Windows 8.1 fonts"
arch=('any')
url="https://www.microsoft.com"
license=('custom')
source=("https://avacyn.aerium.hr/stuff/win81fonts.tar.gz")
sha256sums=('3c45558508979991dffd4d61680ec4011906eef011a7313a264e7b4a9d3930d8')

package() {
  install -Dm644 win81fonts/* -t "$pkgdir/usr/share/fonts/win81fonts"
}
