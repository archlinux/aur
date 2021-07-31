# Maintainer: fossdd <fossdd@tutanota.com>
# Contributor: <https://aur.archlinux.org/user/vorbote>

pkgname=('vim-nano' 'gvim-nano')
pkgver=1
pkgrel=1
arch=('any')
url="https://aur.archlinux.org/packages/vim-nano"
license=('GPL')
provides=('nano')
conflicts=('nano')
replaces=('nano')

package_vim-nano() {
  pkgdesc="Replace nano with vim using symlinks."
  depends=('vim')
  provides+=('gvim-nano')
  conflicts+=('gvim-nano')
  replaces+=('gvim-nano')
  mkdir -p "$pkgdir"/usr/bin
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/nano
}

package_gvim-nano() {
  pkgdesc="Replace nano with gvim using symlinks."
  mkdir -p "$pkgdir"/usr/bin
  depends=('gvim')
  provides+=('vim-nano')
  conflicts+=('vim-nano')
  replaces+=('vim-nano')
  ln -sf /usr/bin/gvim "$pkgdir"/usr/bin/nano
}

# vim: ts=2 sw=2 et :
