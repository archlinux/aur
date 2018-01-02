### Maintainer: Gabriel Retana <isseigx at protonmail dot ch>

pkgname=simplicity-sddm-theme-git
pkgver=latest
pkgrel=1
pkgdesc="Simple SDDM Theme"
arch=('any')
url="https://github.com/gabretana/simplicity-sddm-theme"
license=('GPL')
depends=('sddm')
_theme='simplicity'
_repo='simplicity-sddm-theme'
source=("git+https://github.com/gabretana/simplicity-sddm-theme.git")
md5sums=('SKIP')

#pkgver() {
  #echo "$(git -C "${srcdir}/${_repo_name}" rev-list --count HEAD).0.0"
#}

package() {
  install -d "${pkgdir}"/usr/share/sddm/themes/"${_theme}"
  cp -r "${srcdir}/${_repo}/${_theme}"/* "${pkgdir}"/usr/share/sddm/themes/"${_theme}"/ --preserve=mode
#  find "${pkgdir}"/usr/share/sddm/themes/"${_theme}" -type d -exec chmod 555 {} \;
#  find "${pkgdir}"/usr/share/sddm/themes/"${_theme}" -type f -exec chmod 444 {} \;
}
