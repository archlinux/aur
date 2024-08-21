pkgname=('aocc-flang')
pkgver=4.2.0
pkgrel=1
pkgdesc="AOCC Flang"
arch=('x86_64')
url="https://www.amd.com/en/developer/aocc.html"
license=('custom')
depends=()
makedepends=(p7zip)
source=("https://github.com/zaikunzhang/aocc_flang/raw/main/aocc_flang.deb.7z.001"
        "https://github.com/zaikunzhang/aocc_flang/raw/main/aocc_flang.deb.7z.002")
sha256sums=(SKIP SKIP)

package() {
  7za x aocc_flang.deb.7z.001 -aoa
  ar xv aocc_flang.deb
  tar xJf data.tar.xz
  cp -rv opt "${pkgdir}"
}
