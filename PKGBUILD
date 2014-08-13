# Maintainer: Lara Maia <lara@craft.net.br>
# Contribuitor: Sagar Chalise <chalisesagar@gmail.com>

pkgname=geany-snippets
pkgver=1
pkgrel=5
pkgdesc="Snippets for Geany"
arch=('any')
url="http://www.geany.org/Download/Extras#snippets"
license=('GPL')
depends=('geany')

source=(http://lara.craft.net.br/snippets.conf
        $pkgname.install)
        
install=$pkgname.install

md5sums=('e6c32d7cb454deffe86cb32f62840f34'
         '2011316bb069109d9fc3dbcfb784a73f')

package() {
  cd "$srcdir"
  
  install -Dm644 snippets.conf "$pkgdir"/usr/share/geany/snippets.conf.new
}
