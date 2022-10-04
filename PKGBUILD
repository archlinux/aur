# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=ttf-martian-mono
pkgver=0.9.2
pkgrel=1
pkgdesc='Free and open-source monospaced font from Evil Martians'
arch=('any')
url='https://github.com/evilmartians/mono'
license=('OFL')
source=("https://github.com/evilmartians/mono/releases/download/v$pkgver/martian-mono-$pkgver-ttf.zip"
        "https://raw.githubusercontent.com/evilmartians/mono/main/OFL.txt")
sha256sums=('dee81d4a328abc884d5a3ef26aabe6a8c8d9f6d7c59ecb9535f473c61563d03a'
            SKIP)

package() {
  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
  install -D -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/OFL.txt
}
