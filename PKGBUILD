# Maintainer: WeepingDogel <sydghbsdfyghsdy456@gmail.com>

pkgname=titlegetter
pkgver=2.1.0
pkgrel=5
pkgdesc='A little tool to get the title of the websites and format the title and the links to markdown or html.'
url='https://github.com/WeepingDogel/TitleGetter'
arch=('any')
license=('MIT')
depends=('python>=3.6' 'python-requests' 'python-lxml' 'python-beautifulsoup4' 'python-toml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('57217cb8ed9ec33554065bd59a5f234fba292ea8acc107bbe21e8be7a93611f134592a549301a17145980f2512dd072a32ac5fdb730185f3b3a94e72167c4cea')
package(){
    cd TitleGetter-$pkgver
    install -Dm755 "titlegetter.py" -t "$pkgdir/usr/bin"
    ln -s "titlegetter.py" "$pkgdir/usr/bin/titlegetter"
    install -Dm644 "config/config.toml" -t "$pkgdir/etc/titlegetter"
    install -Dm644 "config/lang.toml" -t "$pkgdir/usr/share/titlegetter"
    install -Dm644 "Pics/2020-09-13_00-17.png" -t "$pkgdir/usr/share/titlegetter/example"
    install -Dm644 "Pics/2020-09-13_00-28.png" -t "$pkgdir/usr/share/titlegetter/example"
    install -Dm644 "Pics/TitleGetter.png" -t "$pkgdir/usr/share/titlegetter/Pics"
    install -Dm644 "list.txt" -t "$pkgdir/usr/share/titlegetter/example"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/titlegetter"
}
