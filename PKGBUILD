# Maintainer: <https://aur.archlinux.org/user/vorbote>

pkgname=('vim-vi' 'gvim-vi')
pkgver=9
pkgrel=1
arch=('any')
url="https://aur.archlinux.org/packages/vim-vi"
license=('GPL')
provides=('vi')
conflicts=('vi')
replaces=('vi')

package_vim-vi() {
  pkgdesc="Replace heirloom vi from core with vim using symlinks."
  depends=('vim')
  provides+=('gvim-vi')
  conflicts+=('gvim-vi')
  replaces+=('gvim-vi')
  mkdir -p "$pkgdir"/usr/bin
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/edit
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/ex
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/vi
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/view
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/redit
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/rex
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/rvi
}

package_gvim-vi() {
  pkgdesc="Replace heirloom vi from core with gvim using symlinks."
  mkdir -p "$pkgdir"/usr/bin
  depends=('gvim')
  provides+=('vim-vi')
  conflicts+=('vim-vi')
  replaces+=('vim-vi')
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/edit
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/ex
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/vi
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/view
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/redit
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/rex
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/rvi
}

# vim: ts=2 sw=2 et :
