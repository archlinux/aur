# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=ruby-docs-rdocs
pkgver=2.2.2
pkgrel=1
pkgdesc="Documentation for the Ruby programming language"
arch=('any')
url="http://www.ruby-doc.org/"
license=('BSD' 'custom')
options=('!strip' 'docs' 'libtool' 'staticlibs' '!zipman')
_core_filename='ruby_2_2_2_core_rdocs.tgz'
_stdlib_filename='ruby_2_2_2_stdlib_rdocs.tgz'
source=("http://www.ruby-doc.org/downloads/$_core_filename" "http://www.ruby-doc.org/downloads/$_stdlib_filename")
md5sums=('38287fc968e17289580266166494be84'
         '999aca9972932de51c4a2b0ecd0cb3d0')
noextract=($_core_filename $_stdlib_filename)

package(){
  mkdir -p "$pkgdir/usr/share/doc/ruby"
  cd "$pkgdir/usr/share/doc/ruby"
  tar -xzf "$srcdir/$_core_filename"
  tar -xzf "$srcdir/$_stdlib_filename"
}
