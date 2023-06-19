# Maintainer:

pkgname="sensible-terminal"
_newpkg="sensible-utils-unified"
pkgver=1.0.0
pkgrel=1
pkgdesc="Meta package to switch to $_newpkg"
arch=('any')
url="https://aur.archlinux.org/packages/$_newpkg"
license=('LGPL')

depends=("$_newpkg")

provides=(
  'sensible-browser'
  'sensible-editor'
  'sensible-pager'
  'sensible-utils-data'
)
conflicts=(${provides[@]})
replaces=(${provides[@]})
