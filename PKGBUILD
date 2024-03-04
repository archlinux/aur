pkgname=versiobit
pkgver=3.14
pkgrel=1
pkgdesc="Versiobit Desktop App"
arch=("x86_64")
url="https://versiobit.com"
license=("custom")
#depends=('dependencies_required_by_your_software')

source=("versiobit-$pkgver.tar.gz::https://releases.versiobit.com/linux/generic/versiobit-$pkgver.tar.gz")
sha512sums=("SKIP")

package() {
    cd "$srcdir"
    tar xaf versiobit-$pkgver.tar.gz
    mkdir "$pkgdir/opt"
    cp -r "$srcdir/versiobit" "$pkgdir/opt/versiobit"
    
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/versiobit/bin/versiobit" "$pkgdir/usr/bin/versiobit"
}
