# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=otf-martian-mono
pkgver=0.9.2
pkgrel=1
pkgdesc='Free and open-source monospaced font from Evil Martians'
arch=('any')
url='https://github.com/evilmartians/mono'
license=('OFL')
source=("https://github.com/evilmartians/mono/releases/download/v$pkgver/martian-mono-$pkgver-otf.zip"
        "https://raw.githubusercontent.com/evilmartians/mono/main/OFL.txt")
sha256sums=('e03646305b5fa3dd4ce58c8d0c8348f939e8500e47af534dc64c47978c27f6b5'
            SKIP)

package() {
  install -d $pkgdir/usr/share/fonts/OTF
  install -m644 *.otf $pkgdir/usr/share/fonts/OTF/
  install -D -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/OFL.txt
}
