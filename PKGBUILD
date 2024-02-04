# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=amdgpu_top-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Tool to display AMDGPU usage (binary release)"
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=('MIT')
arch=('x86_64')
depends=('libdrm')
provides=("amdgpu_top")
conflicts=("amdgpu_top")
source=("$url/releases/download/v$pkgver/amdgpu-top_${pkgver}-1_amd64.deb")
sha256sums=('c2522991cb66bb6678a48c08f7ef32a541661bb760c97eae9f84172b85ffa381')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/usr/share/doc" "$pkgdir/usr/share/licenses"
}
