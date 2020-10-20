# Maintainer: LightQuantum <self at lightquantum dot me>

pkgname=latex-sjtutex
pkgver=1.0.0RC7
pkgrel=1
pkgdesc="Macro Packages and Scripts for SJTU TeX users"
arch=(any)
url="https://github.com/sjtug/SJTUTeX"
license=('LPPL')
depends=('texlive-core')
makedepends=('git' 'unzip' 'zip')
install="${pkgname}.install"
source=('https://github.com/sjtug/SJTUTeX/releases/download/1.0.0rc7/sjtuthesis.tds.zip')
md5sums=('5e4dbcaf104629075a86d6e6023aec19')

package() {
    mkdir -p $pkgdir/usr/share/texmf-dist/
    unzip -o -q sjtuthesis.tds.zip -d $pkgdir/usr/share/texmf-dist/
}
