# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
_pkgname=sslsecure.vim
pkgname=vim-sslsecure
pkgver=1.0.0
pkgrel=1
pkgdesc='Highlight insecure SSL configuration in Vim (works for all OpenSSL/ LibreSSL cipher strings, independent of the filetype)'
arch=('any')
url='https://github.com/chr4/sslsecure.vim'
license=('GPL3')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chr4/sslsecure.vim/archive/v${pkgver}.tar.gz")
sha512sums=('24a534afb0f731d3c8b361d12536d33b1cba4e11d7d4c52f413eebe04bfa168e5d60fde68d646ee72fefdf8f74b76328e38fe6f94b59df9fc0aeea890755c6af')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm644 'plugin/sslsecure.vim' "${pkgdir}/usr/share/vim/vimfiles/plugin/sslsecure.vim"
}

# vim:set et sw=2 ts=2 tw=79:
