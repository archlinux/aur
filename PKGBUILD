# Maintainer: yeet <support@yeet.cx>
pkgname=yeet-bin
pkgver=0.19.5
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
sha256sums_x86_64=('895ce2c7c66a530402cfcfb1cafc4a9dc986c274823c8759704e6534aaad6c6c'
                   'SKIP')
sha256sums_aarch64=('2df21fa2733818a27afc802fc296ed9a0e9753c03917a73106089fc0c1dfd282'
                    'SKIP')
