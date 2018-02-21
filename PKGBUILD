# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=ruby-docs-rdocs
pkgver=2.5.0
pkgrel=1
pkgdesc="Documentation for the Ruby programming language"
arch=('any')
url="http://www.ruby-doc.org/"
license=('BSD' 'custom')
options=('!strip' 'docs' 'libtool' 'staticlibs' '!zipman')
_core_filename='ruby_2_5_0_core_rdocs.tgz'
_stdlib_filename='ruby_2_5_0_stdlib_rdocs.tgz'
source=("http://www.ruby-doc.org/downloads/$_core_filename" "http://www.ruby-doc.org/downloads/$_stdlib_filename")
sha512sums=('afc5ecbeebdaa2a9971f84d07b9291a97b38c73acc3dfb8a9f065d257934e5c97eee06a7052677e6a550908ef05dfdf083cc6b97a85d0809c54df01231a5dfd1'
            'b2fe64f383da8e8549fdac90779f717de6aa69e837f3fb6e4580441330df43860f83552982e684c47b31e7e5c2be4ad3d10d3a58d6dea8a6622abfaa01f685f5')
noextract=($_core_filename $_stdlib_filename)

package(){
  mkdir -p "$pkgdir/usr/share/doc/ruby"
  cd "$pkgdir/usr/share/doc/ruby"
  tar -xzf "$srcdir/$_core_filename"
  tar -xzf "$srcdir/$_stdlib_filename"
}
