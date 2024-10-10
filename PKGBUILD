pkgname=versiobit
pkgver=3.18
pkgrel=1
pkgdesc="Versiobit Desktop App"
arch=("x86_64")
url="https://versiobit.com"
license=("custom")
#depends=('dependencies_required_by_your_software')

source=("versiobit-$pkgver.zip::https://releases.versiobit.com/linux/generic/versiobit-$pkgver.zip")
sha512sums=("SKIP")

package() {
    cd "$srcdir"
    unzip -o versiobit-$pkgver.zip
    mkdir "$pkgdir/opt"
    cp -r "$srcdir/versiobit" "$pkgdir/opt/versiobit"
    
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/versiobit/bin/versiobit" "$pkgdir/usr/bin/versiobit"
}
