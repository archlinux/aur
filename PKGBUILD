# Maintainer: WeepingDogel <sydghbsdfyghsdy456@gmail.com>

pkgname=titlegetter
pkgver=2.1.0
pkgrel=3
pkgdesc='A little tool to get the title of the websites and format the title and the links to markdown or html.'
url='https://github.com/WeepingDogel/TitleGetter'
arch=('any')
license=('MIT')
depends=('python>=3.6' 'python-requests' 'python-lxml' 'python-beautifulsoup4' 'python-toml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('694c17746a9b3670e8d02b6938a570412b7c39cd0aa3766dcf208a3aad9f7f1fd24ed807f7051962cd6f133d1e45d0c096b659f5011eb8b95d0416953e9c68ae')
package(){
    cd TitleGetter-$pkgver
    install -Dm755 "titlegetter.py" -t "$pkgdir/usr/bin"
    ln -s "titlegetter.py" "$pkgdir/usr/bin/titlegetter"
    install -Dm644 "config/config.toml" -t "$pkgdir/etc/titlegetter"
    install -Dm644 "config/lang.toml" -t "$pkgdir/usr/share/titlegetter"
    install -Dm644 "Pics/2020-09-13_00-17.png" -t "$pkgdir/usr/share/titlegetter/example"
    install -Dm644 "Pics/2020-09-13_00-28.png" -t "$pkgdir/usr/share/titlegetter/example"
    install -Dm644 "list.txt" -t "$pkgdir/usr/share/titlegetter/example"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/titlegetter"
}