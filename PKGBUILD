# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-notes
pkgver=1.0.1
pkgrel=1
pkgdesc="Terminal-based note-taking application"
arch=('x86_64')
url="https://github.com/felipealfonsog/TermNotes"
license=('MIT')
depends=('gcc' 'vim' 'nano')

#https://github.com/felipealfonsog/TermNotes/archive/refs/tags/v.1.0.1.tar.gz
source=("https://github.com/felipealfonsog/TermNotes/archive/refs/tags/v.$pkgver.tar.gz")

build() {
  cd "$srcdir/TermNotes-$pkgver"
  make
}

package() {
  cd "$srcdir/TermNotes-$pkgver"
  install -Dm755 term_notes "$pkgdir/usr/bin/term_notes"
}

sha256sums=('0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef')
