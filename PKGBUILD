# Maintainer: yeet <support@yeet.cx>
pkgname=yeet-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="yeet daemon and associated tools"
arch=('x86_64' 'aarch64')
url="https://yeet.cx/"
license=('BSD3')
install=yeet.install
source_x86_64=("https://pkgs.yeet.cx/archlinux/os/x86_64/stable/yeet-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" "https://pkgs.yeet.cx/archlinux/os/x86_64/stable/yeet-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.sig")
source_aarch64=("https://pkgs.yeet.cx/archlinux/os/aarch64/stable/yeet-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst" "https://pkgs.yeet.cx/archlinux/os/aarch64/stable/yeet-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst.sig")
validpgpkeys=("F537B2E78670F4F6C75D0E997FE0E3E7218228E6")
options=('!debug')

package() {
  bsdtar -xf "yeet-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst" -C "${pkgdir}"
  rm -f "${pkgdir}/.PKGINFO" "${pkgdir}/.INSTALL" "${pkgdir}/.MTREE" "${pkgdir}/.BUILDINFO"
}
sha256sums_x86_64=('3c771d827de504b25418ebf863482a1fd5ac27a8f20e3f599c8e6c61efe05ea3'
                   'SKIP')
sha256sums_aarch64=('cd5ed0c40ee01d1b33f6e26845935c7913ff92dccb0dad341def84ccd6e53768'
                    'SKIP')
