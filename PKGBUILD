# Maintainer: yeet <support@yeet.cx>
pkgname=yeet-bin
pkgver=0.24.1
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
sha256sums_x86_64=('05cb32161ac0b6badb0508452d5a55f6f7bf7cf4d84fa73590f48e7cba607fe2'
                   'SKIP')
sha256sums_aarch64=('5ec00f46f929100a23a79471cb5df42613cc2b4e3780aee4da39499f2b965a7a'
                    'SKIP')
