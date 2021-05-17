# Maintainer: WeepingDogel <sydghbsdfyghsdy456@gmail.com>

pkgname=titlegetter
pkgver=2.2.0
pkgrel=1
pkgdesc='A little tool to get the title of the websites and format the title and the links to markdown or html.'
url='https://github.com/WeepingDogel/TitleGetter'
arch=('any')
license=('MIT')
depends=('python>=3.6' 'python-requests' 'python-lxml' 'python-beautifulsoup4' 'python-toml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('e757701d5d57a563f2ee56dbfd68c9772fc1d81481467872cb98ec25a7dcfa576f4e7e335dd311cafe4e377dc09f3ef5963c5ee6e713dba3fb868bc3dddcf98c')
package(){
    cd TitleGetter-$pkgver
    install -Dm755 "titlegetter.py" -t "$pkgdir/usr/bin"
    ln -s "titlegetter.py" "$pkgdir/usr/bin/titlegetter"
    install -Dm644 "config/config.toml" -t "$pkgdir/etc/titlegetter"
    install -Dm644 "Pics/2020-09-13_00-17.png" -t "$pkgdir/usr/share/titlegetter/example"
    install -Dm644 "Pics/2020-09-13_00-28.png" -t "$pkgdir/usr/share/titlegetter/example"
    install -Dm644 "Pics/TitleGetter.png" -t "$pkgdir/usr/share/titlegetter/Pics"
    install -Dm644 "list.txt" -t "$pkgdir/usr/share/titlegetter/example"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/titlegetter"
}
