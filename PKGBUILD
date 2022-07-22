# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=ttf-martian-mono
pkgver=0.9.1
pkgrel=1
pkgdesc='Free and open-source monospaced font from Evil Martians'
arch=('any')
url='https://github.com/evilmartians/mono'
license=('OFL')
source=("https://github.com/evilmartians/mono/releases/download/v$pkgver/martian-mono-$pkgver-ttf.zip"
        "https://raw.githubusercontent.com/evilmartians/mono/main/OFL.txt")
sha256sums=('15901df2bfc7ab2a4a37d59521b774b93a4e1fa4155f2ec2fce68a4c8d1d2d40'
            SKIP)

package() {
  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
  install -D -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/OFL.txt
}
