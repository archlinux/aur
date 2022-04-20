pkgname=('vim-vi' 'gvim-vi')
pkgver=11
pkgrel=2
arch=('any')
url="https://github.com/palopezv/vim-vi"
license=('GPL')

package_vim-vi() {
  pkgdesc="Replace heirloom vi from core with vim using symlinks and add missing links in the official package."
  depends=('vim')
  provides+=('vi' 'gvim-vi')
  replaces+=('vi')
  mkdir -p "$pkgdir"/usr/bin
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/vi
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/rvi
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/edit
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/redit
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/vedit
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/view
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/ex
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/rex
}

package_gvim-vi() {
  pkgdesc="Replace heirloom vi from core with gvim using symlinks and add missing links in the official package."
  mkdir -p "$pkgdir"/usr/bin
  depends=('gvim')
  provides+=('vi' 'vim-vi')
  replaces+=('vi')
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/vi
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/rvi
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/edit
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/redit
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/vedit
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/view
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/ex
  ln -sf /usr/bin/vim "$pkgdir"/usr/bin/rex
}

# vim: ts=2 sw=2 et :
