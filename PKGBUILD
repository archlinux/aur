# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gitcommit=fb0210303f67325162a5f132b6a3f709dcd8e181

pkgname=sddm-theme-clairvoyance
pkgver=1.0+1+fb02103
pkgrel=1
pkgdesc="An SDDM theme by Ellis Kesterton"
arch=('any')
url="https://github.com/Eayu/sddm-theme-clairvoyance"
license=('CC-BY-SA')
depends=('sddm' 'ttf-fira-mono')
makedepends=('git' 'tar')
source=("git+${url}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

package() {
  # cd "${srcdir}/${pkgname}"
  # install -d "${pkgdir}/usr/share/sddm/themes/"
  # git archive master --prefix="clairvoyance/" | tar -x -C "${pkgdir}/usr/share/sddm/themes/"
  # rm -rf "${pkgdir}/usr/share/sddm/themes/clairvoyance/.gitignore"

  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/sddm/themes/"
  cp -r "${pkgname}" "${pkgdir}/usr/share/sddm/themes/clairvoyance"
  rm -rf "${pkgdir}/usr/share/sddm/themes/clairvoyance/.git"
  rm -rf "${pkgdir}/usr/share/sddm/themes/clairvoyance/.gitignore"
}
