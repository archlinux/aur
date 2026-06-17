# Maintainer: yeet <support@yeet.cx>
pkgname=yeet-bin
pkgver=0.19.2
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
sha256sums_x86_64=('cc1be4e0b22174737d2d861291e953d9fa98377c069833ae92c4432b2b3f85be'
                   'SKIP')
sha256sums_aarch64=('2e115b908661ae34b7f02feb7696e351d716b2480f89a618403c149983dce69a'
                    'SKIP')
