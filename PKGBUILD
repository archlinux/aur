# Maintainer: yeet <support@yeet.cx>
pkgname=yeet-bin
pkgver=0.19.4
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
sha256sums_x86_64=('38191f9dd8c22ebfbb4f3e1dae3f50150b9018b039bbc095ac1dd3236849562e'
                   'SKIP')
sha256sums_aarch64=('9a761550cf87370dd4d991ec7018af78f28eba10e34147efed6216b1737330a7'
                    'SKIP')
