# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=otf-martian-mono
pkgver=1.1.0
pkgrel=1
pkgdesc='Free and open-source monospaced font from Evil Martians'
arch=('any')
url='https://github.com/evilmartians/mono'
license=('OFL')
source=("https://github.com/evilmartians/mono/releases/download/v$pkgver/martian-mono-$pkgver-otf.zip"
        "https://raw.githubusercontent.com/evilmartians/mono/main/OFL.txt")
sha256sums=('485d8f831ddedca577132ab5d55d2d59b14ea8b587ab127e9cde5d3ce0dc9a36'
            SKIP)

package() {
  install -d $pkgdir/usr/share/fonts/OTF
  install -m644 *.otf $pkgdir/usr/share/fonts/OTF/
  install -D -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/OFL.txt
}
