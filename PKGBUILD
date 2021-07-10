# Maintainer: WeepingDogel

pkgname=homepager
pkgver=1.0beta
pkgrel=0
pkgdesc='A simple homepage generator.'
url='https://github.com/NewAwkwardTools/homepager'
arch=('any')
license=('MIT')
depends=('python>=3.6' 'titlegetter' 'python-toml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('38796c8594f12694e75e04f22a393bf57da4bbe941fa653b66812662da306e0a1966ce2ef4ce30eae3e37cc0879921c40b475b97d8e0815f57946742fb5cb592')
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