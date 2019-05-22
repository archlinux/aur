# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name='git-prompt.zsh'
pkgname="${_name}"
pkgver=2.0.1
pkgrel=1
pkgdesc='A fast, pure-shell, single-file Git prompt for Zsh.'
arch=('any')
url="https://github.com/woefe/${_name}"
license=('MIT')
source=("https://github.com/woefe/git-prompt.zsh/archive/v${pkgver}.tar.gz")
depends=('git' 'zsh')
conflicts=('git-prompt.zsh-git')
sha256sums=('725eb7ac29b1b14dcce5c8c70e1b6c5954e6ec29332cc8f4c536f7c9cdbd2751')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -d "${pkgdir}/usr/share/zsh/scripts"
  install -m 0644 "${_name}" "${pkgdir}/usr/share/zsh/scripts/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
