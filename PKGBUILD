pkgname=netbeans-plugin-color-codes-preview-bin
pkgver=0.13.4
verid=233
pkgrel=1
pkgdesc='A NetBenas Plugin made you can get color preview of CSS'
arch=('any')
license=('Apache-2.0')
url='https://plugins.netbeans.apache.org/catalogue/?id=24'
source=("https://plugins.netbeans.apache.org/catalogue/download/$verid/netbeans-color-codes-preview-$pkgver.nbm")
depends=('netbeans>=12')
install='.install'

package () {
  cd "$srcdir"
  mkdir -p "$pkgdir/tmp/netbeans-color-codes-preview"
  cp netbeans-color-codes-preview-$pkgver.nbm "$pkgdir/tmp/netbeans-color-codes-preview"
}