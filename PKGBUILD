# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=otf-martian-mono
pkgver=0.9.0
pkgrel=1
pkgdesc='Free and open-source monospaced font from Evil Martians'
arch=('any')
url='https://github.com/evilmartians/mono'
license=('OFL')
source=("https://github.com/evilmartians/mono/releases/download/v$pkgver/martian-mono-$pkgver-otf.zip"
        "https://raw.githubusercontent.com/evilmartians/mono/main/OFL.txt")
sha256sums=('2d7c4e9103b1df5551eb6d91f19122b80bb82e97aa77d7ddc65cb3edc95cd8d3'
            SKIP)

package() {
  install -d $pkgdir/usr/share/fonts/OTF
  install -m644 *.otf $pkgdir/usr/share/fonts/OTF/
  install -D -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/OFL.txt
}
