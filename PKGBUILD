pkgname=blingbling
pkgver=2.2
pkgrel=1
pkgdesc="Fancy Widgets, Popups and signals for Awesome WM"
arch=('any')
url="https://github.com/cedlemo/blingbling"
license=('GPL2')
depends=('awesome'
         'lua-oocairo-git')
conflicts=('blingbling-git')
provides=('blingbling')
source=("${url}/archive/v${pkgver}.zip")
sha512sums=('d4e22002afc58c1831bda0fa198feed312bc79e09d4de71807e331f5bb6a30debaba7c8206aabc11d9f86240f3c25c4d7496fc61a01c4a5aa566f8353b7bdf82')

build(){
    mv  blingbling-${pkgver}  blingbling
}

package() {
  install -dm755 "$pkgdir/usr/share/awesome/lib/blingbling"
  rm -r blingbling/{doc,config_example}
  cp -a blingbling "$pkgdir/usr/share/awesome/lib/"
}
