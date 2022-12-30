# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=ttf-martian-mono-variable
provides=('ttf-martian-mono=1.0.0')
pkgver=1.0.0
pkgrel=1
pkgdesc='Free and open-source monospaced font from Evil Martians, variable version with all weights and widths in one file.'
arch=('any')
url='https://github.com/evilmartians/mono'
license=('OFL')
source=("https://github.com/evilmartians/mono/releases/download/v$pkgver/martian-mono-$pkgver-variable.zip"
        "https://raw.githubusercontent.com/evilmartians/mono/v$pkgver/OFL.txt")
sha256sums=('a526fafe51d1afba9d729c788655b0f8ac79ed836482a53211acc3955e1d2d19'
            'ddafd2c3f37ef1d83ef284ca63e159befd3820850c5e9eded14ca52eee92c256')

package() {
  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 MartianMonoVF.ttf $pkgdir/usr/share/fonts/TTF/
  install -D -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/OFL.txt
}
