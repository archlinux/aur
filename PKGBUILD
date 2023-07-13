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

#sha256sums=('c9cabc195345db92f8297ecf35399622bfa7583362830dd459fd65c89917f86b')
#sha256sums=('8e7004e9b92add9b507fd21d1b8220c67aaeeab80de42ac1221859d2e1622a76')
sha256sums=('43db1b333d8902b15df4444d12e76c6d80fa9535cb377f7594d3cfa19c64e869')
