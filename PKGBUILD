# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-notes
pkgver=1.0.4
pkgrel=1
pkgdesc="Terminal-based note-taking application"
arch=('x86_64')
url="https://github.com/felipealfonsog/TermNotes"
license=('MIT')
depends=('gcc' 'vim' 'nano' 'neovim' 'libutil-linux' 'coreutils')

# Define version-specific variables
_sourcebasename="v.${pkgver}"
source=("https://github.com/felipealfonsog/TermNotes/archive/${_sourcebasename}.tar.gz")

build() {
  #cd "${srcdir}/${pkgname}-${_sourcebasename}/src"
  gcc -o term-notes term_notes_linux.c
}

package() {
  #cd "${srcdir}/${pkgname}-${_sourcebasename}/src"
  install -Dm755 term-notes "${pkgdir}/usr/bin/term-notes"
}

sha256sums=('ee0993e675697753282e874a79bce68fb433b1ecd1ca87736737ebbfba477558')

