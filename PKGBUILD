# Maintainer: absrdspc <repom2[at]airmail[dot]cc>

pkgname=phgen
pkgver=1.0
pkgrel=1
pkgdesc="Pattern-based random phrase generation using WordNet"
arch=('any')
url="https://github.com/AbsurdlySuspicious/PhraseGen"
license=('Apache')
depends=('java-runtime>=8' 'bash')
provides=('phgen')
conflicts=('phgen-git')

source=("phgen-bin"
        "https://github.com/AbsurdlySuspicious/PhraseGen/releases/download/1.0/phgen-1.0.jar")

sha256sums=('29cecf4462abc2d92cf0153af8892902c8768d582f14c659715b5a0dfba5a6e4'
            '52794e20c21f7e5efa559e0576db01bdeab4cf7e4449261418b2f220ab4a42e3')

package() {
  install -Dm755 -T "$srcdir/phgen-bin" "$pkgdir/usr/bin/phgen"
  install -Dm644 -T "$srcdir/phgen-$pkgver.jar" "$pkgdir/usr/share/java/phgen/phgen.jar"
}

