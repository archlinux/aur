# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgver=2026.01.05
_upstream_ver='1767748971-1'
sha256sums=(
  'bfd76443265e4d0d17875db76f47691efd0142043b9012eec6ebdc8e938a7fad'
)

_repo_url='https://github.com/AndydeCleyre/archbuilder_iosevka'
_repo_branch='andysevka-console'

pkgname="ttf-${_repo_branch}"
pkgrel=1
pkgdesc='A configured build of Iosevka (Fixed spacing), intended for conversion to bitmap font'
arch=('any')
url="${_repo_url}/tree/${_repo_branch}"
license=('custom:OFL')
source=(
  "${_repo_url}/releases/download/${_repo_branch}-${pkgver}/ttf-iosevka-fixed-custom-git-${_upstream_ver}-any.pkg.tar.zst"
)

package () {
  mv usr/share/licenses/ttf-iosevka-fixed-custom-git "usr/share/licenses/ttf-${_repo_branch}"
  cp -a usr "${pkgdir}/"
}
