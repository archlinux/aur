# Maintainer: WeepingDogel

pkgname=homepager
pkgver=1.1beta
pkgrel=0
pkgdesc='A simple homepage generator.'
url='https://github.com/NewAwkwardTools/homepager'
arch=('any')
license=('MIT')
depends=('python>=3.6' 'titlegetter' 'python-toml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('1f03c863f7cc8f5ec630642560c0b0bf4a2faaed33baf212781a5cd221deab11fd9be3862522179fd348bb921dcb96d816803dbbe4a3c3a70f05d27ffb3b1f2b')
package(){
    cd homepager-$pkgver
    install -Dm755 "homepager.py" -t "$pkgdir/usr/bin"
    mv "$pkgdir/usr/bin/homepager.py" "$pkgdir/usr/bin/homepager"
    install -Dm644 "config/config.toml" -t "$pkgdir/etc/homepager"
    install -Dm644 "resources/Pics/Screenshot-2021-07-03-at-19-10-43-HomePage.png" -t "$pkgdir/usr/share/homepager/Pics"
    install -Dm644 "resources/example.html" -t "$pkgdir/usr/share/homepager"
    install -Dm644 "resources/style.css" -t "$pkgdir/usr/share/homepager"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/homepager"
}