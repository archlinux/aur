# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=ttf-martian-mono
pkgver=1.1.0
pkgrel=1
pkgdesc='Free and open-source monospaced font from Evil Martians'
arch=('any')
url='https://github.com/evilmartians/mono'
license=('OFL')
source=("https://github.com/evilmartians/mono/releases/download/v$pkgver/martian-mono-$pkgver-ttf.zip"
        "https://raw.githubusercontent.com/evilmartians/mono/main/OFL.txt")
sha256sums=('1336e488379fb4841fd99ad085f96a3e69829cb4458b07391170d9b4f14217e2'
            SKIP)

package() {
  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
  install -D -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/OFL.txt
}
