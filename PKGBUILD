# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name='git-prompt.zsh'
pkgname="${_name}"
pkgver=2.2.1
pkgrel=1
pkgdesc='A fast, pure-shell, single-file Git prompt for Zsh.'
arch=('any')
url="https://github.com/woefe/${_name}"
license=('MIT')
source=("https://github.com/woefe/git-prompt.zsh/archive/v${pkgver}.tar.gz")
depends=('git' 'zsh')
conflicts=('git-prompt.zsh-git')
sha256sums=('4305e3376343fb03bf837bfd6155da76ecbaedf8dac1bc0463a888b1dfb52249')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -d "${pkgdir}/usr/share/zsh/scripts"
  install -m 0644 "${_name}" "${pkgdir}/usr/share/zsh/scripts/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
