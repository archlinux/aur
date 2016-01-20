# Maintainer: Ainola
pkgname=neovim-csound
pkgver=1
pkgrel=1
pkgdesc="Set of Tools for Editing Csound Files with Neovim"
arch=('any')
url="http://www.eumus.edu.uy/docentes/jure/csound/vim/"
license=('custom')
groups=('neovim-plugins')
depends=('neovim')
optdepends=('csound')
install='neovim-csound.install'
source=('http://ainola.sdf.org/vim-csound.tar.gz')
sha256sums=('5dbec0f3c7dcae48d3c4adafcab029a5caab8d9bd824b6e10a88533650c4f104')

package() {
  _vimdir="$pkgdir/usr/share/nvim/runtime"
  install -Dm644 "$srcdir/doc/csound.txt"            "$_vimdir/doc/csound.txt"
  install -Dm644 "$srcdir/ftdetect/csoundft.vim"     "$_vimdir/ftdetect/csoundft.vim"
  install -Dm644 "$srcdir/macros/csound_macros.vim"  "$_vimdir/macros/csound_macros.vim"
  install -Dm644 "$srcdir/syntax/csound.vim"         "$_vimdir/syntax/csound.vim"
  install -Dm644 "$srcdir/syntax/csound_opcodes.vim" "$_vimdir/syntax/csound_opcodes.vim"
  install -Dm644 "$srcdir/templates/template.csd"    "$_vimdir/templates/template.csd"
}

#vim:set ts=2 sw=2 et:
