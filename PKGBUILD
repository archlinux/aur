# shellcheck disable=SC2181,SC2148,SC2034,SC2164,SC2154

pkgname=ttf-win81-fonts
pkgver=1.1
pkgrel=1
pkgdesc="Windows 8.1 fonts"
arch=('any')
url="https://www.microsoft.com"
license=('custom')
source=("https://avacyn.aerium.hr/stuff/win81fonts2.tar.gz")
sha256sums=('77d3ace39014e26c39ae6f27954e489541eb23a0fbc18c374e5abe028e72bdb5')

package() {
  install -Dm644 win81fonts2/* -t "$pkgdir/usr/share/fonts/win81fonts"
}
