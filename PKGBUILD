# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=amdgpu_top-bin
pkgver=0.10.3
pkgrel=1
pkgdesc="Tool to display AMDGPU usage (binary release)"
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=('MIT')
arch=('x86_64')
depends=('libdrm')
provides=("amdgpu_top")
conflicts=("amdgpu_top")
source=("$url/releases/download/v$pkgver/amdgpu-top_${pkgver}-1_amd64.deb")
sha256sums=('ad554546843b28f1784e100b0d89fd862a9aa2b96053520595b17a88f0407769')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/usr/share/doc" "$pkgdir/usr/share/licenses"
}
