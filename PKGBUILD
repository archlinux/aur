# Maintainer: Pablo Moyano (p4block)
pkgname=gtksourceview3-highlight-smali
pkgver=LATEST
pkgrel=2
pkgdesc="Smali (Dalvik bytecode) syntax highlighter for GTK apps like Gedit"
arch=('any')
url="https://github.com/CriticalBlue/smali-syntax-highlighter"
license=('GPL2')
makedepends=('git')
source=("git+https://github.com/CriticalBlue/smali-syntax-highlighter.git")
md5sums=('SKIP') 


package() {
  cd "${srcdir}/smali-syntax-highlighter"
  
  install -Dm644 smali.lang "${pkgdir}/usr/share/gtksourceview-3.0/language-specs/smali.lang"
}
