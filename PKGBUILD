# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# PKGBUILD file for link-vim-to-vi.
# Contributor: Patrick Goetz <pgoetz@linuxcs.com>

pkgname='vi-vim-symlink'
pkgver='1'
pkgrel='1'
pkgdesc='Replace vi with vim'
arch=('any')
url='http://www.vim.org'
license=('CDDL')
depends=('vim')
provides=('vi')
conflicts=('vi')

package() {
  set -u
  install -d "${pkgdir}/usr/bin"
  ln -sf 'vim' "${pkgdir}/usr/bin/vi"
  ln -sf 'vim' "${pkgdir}/usr/bin/view"
  set +u
}

