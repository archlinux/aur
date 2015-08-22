# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=ruby-docs-rdocs
pkgver=2.2.3
pkgrel=1
pkgdesc="Documentation for the Ruby programming language"
arch=('any')
url="http://www.ruby-doc.org/"
license=('BSD' 'custom')
options=('!strip' 'docs' 'libtool' 'staticlibs' '!zipman')
_core_filename='ruby_2_2_3_core_rdocs.tgz'
_stdlib_filename='ruby_2_2_3_stdlib_rdocs.tgz'
source=("http://www.ruby-doc.org/downloads/$_core_filename" "http://www.ruby-doc.org/downloads/$_stdlib_filename")
md5sums=('d50c3966b8d4d24d87f46477d85ac097'
         'ddbca6d4cd3eb5a17fbc7f55017738d6')
noextract=($_core_filename $_stdlib_filename)

package(){
  mkdir -p "$pkgdir/usr/share/doc/ruby"
  cd "$pkgdir/usr/share/doc/ruby"
  tar -xzf "$srcdir/$_core_filename"
  tar -xzf "$srcdir/$_stdlib_filename"
}
