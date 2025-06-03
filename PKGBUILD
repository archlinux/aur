# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=ttf-martian-grotesk-variable
provides=('ttf-martian-grotesk=1.0.0')
pkgver=1.0.0
pkgrel=1
pkgdesc='Free and open-source sans-serif typeface family with a distinctive personality from Evil Martians, variable version with all weights and widths in one file.'
arch=('any')
url='https://github.com/evilmartians/grotesk'
license=('OFL')
source=("https://github.com/evilmartians/grotesk/releases/download/v$pkgver/martian-grotesk-$pkgver-variable.zip"
        "https://raw.githubusercontent.com/evilmartians/grotesk/v$pkgver/OFL.txt")
sha256sums=('9d467bfee73e54e4347392b8f3cef436cd5dbc5bff602f5e2e18d6d144694311'
            '92b0fe50842b9348a71a1ddeb5115ed4e86e89ce4938f706c95e1441e4e7020b')

package() {
  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 variable/MartianGrotesk-VFVF.ttf $pkgdir/usr/share/fonts/TTF/
  install -D -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/OFL.txt
}
