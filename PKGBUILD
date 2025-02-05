# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=eol-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI tool for endoflife.date"
arch=('x86_64')
url="https://github.com/kobayashi/eol"
license=('MIT')
source=("eol-v${pkgver}-linux-amd64.tar.gz::https://github.com/kobayashi/eol/releases/download/v${pkgver}/eol_Linux_x86_64.tar.gz")
sha256sums=('810edd4025ef033e190f52d95cb20f154e0842d5e9ba0912f1182fd633e1e036')

package() {
  install -Dm 755 "$srcdir/eol" "$pkgdir/usr/bin/eol"
}
