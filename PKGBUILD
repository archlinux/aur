# Maintainer:

_pkgname="sensible-utils"
pkgbase="sensible-utils-old"
_newpkg="sensible-utils-unified"
pkgname=("$_pkgname")
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
  'sensible-terminal'
  'sensible-utils-data'
)
conflicts=(${provides[@]})
replaces=(${provides[@]})
