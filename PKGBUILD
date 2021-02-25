# Maintainer: WeepingDogel <sydghbsdfyghsdy456@gmail.com>

pkgname=titlegetter
pkgver=2.1.0
pkgrel=4
pkgdesc='A little tool to get the title of the websites and format the title and the links to markdown or html.'
url='https://github.com/WeepingDogel/TitleGetter'
arch=('any')
license=('MIT')
depends=('python>=3.6' 'python-requests' 'python-lxml' 'python-beautifulsoup4' 'python-toml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('edd9dc4b72e4baa3618d709f920ad06108aea5c131df60444cf9c4cafc5e646745725308d8a308f99274fef8fc77fb59a1f6a63f820bada772409a4e5ac3e0a2')
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