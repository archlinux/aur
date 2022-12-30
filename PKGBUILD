# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=ttf-martian-mono
pkgver=1.0.0
pkgrel=1
pkgdesc='Free and open-source monospaced font from Evil Martians'
arch=('any')
url='https://github.com/evilmartians/mono'
license=('OFL')
source=("https://github.com/evilmartians/mono/releases/download/v$pkgver/martian-mono-$pkgver-ttf.zip"
        "https://raw.githubusercontent.com/evilmartians/mono/main/OFL.txt")
sha256sums=('a990b5620a97b1fc6af1e9808e7af82f8bf96b2a5692beff9e01b9e5adf92a71'
            SKIP)

package() {
  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
  install -D -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/OFL.txt
}
