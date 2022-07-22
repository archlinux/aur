# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=otf-martian-mono
pkgver=0.9.1
pkgrel=1
pkgdesc='Free and open-source monospaced font from Evil Martians'
arch=('any')
url='https://github.com/evilmartians/mono'
license=('OFL')
source=("https://github.com/evilmartians/mono/releases/download/v$pkgver/martian-mono-$pkgver-otf.zip"
        "https://raw.githubusercontent.com/evilmartians/mono/main/OFL.txt")
sha256sums=('35bbb65f4e1e6e60bc1d0a3e39bdd1c19de963e6cf7e980cf11fb69c5f63a644'
            SKIP)

package() {
  install -d $pkgdir/usr/share/fonts/OTF
  install -m644 *.otf $pkgdir/usr/share/fonts/OTF/
  install -D -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/OFL.txt
}
