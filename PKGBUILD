# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=ttf-martian-mono
pkgver=1.1.0
pkgrel=2
pkgdesc='Free and open-source monospaced font from Evil Martians'
arch=('any')
url='https://github.com/evilmartians/mono'
license=('OFL')
source=("https://github.com/evilmartians/mono/releases/download/v$pkgver/martian-mono-$pkgver-ttf.zip"
        "https://raw.githubusercontent.com/evilmartians/mono/main/OFL.txt")
sha256sums=('483aa2d201a6c44610c0bdcf65eaf425b467d61e9ab606213eacef3e216c2a12'
            SKIP)

package() {
  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
  install -D -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/OFL.txt
}
