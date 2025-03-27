pkgname=rusted-paratrooper
pkgver=1.1.2
pkgrel=1
pkgdesc="Paratrooper remake written in Rust"
arch=('x86_64')
url='https://github.com/denix666/paratrooper'
license=('MIT')

source=('https://github.com/denix666/paratrooper/releases/download/v1.1.2/paratrooper_linux_x86_64.tar.gz'
	'rusted-paratrooper_icon.png'
	'rusted-paratrooper.desktop')

package() {
    cd ${srcdir}
    install -D -m755 paratrooper ${pkgdir}/usr/bin/paratrooper
    install -D -m644 rusted-paratrooper_icon.png ${pkgdir}/usr/share/pixmaps/rusted-paratrooper_icon.png
    install -D -m644 rusted-paratrooper.desktop ${pkgdir}/usr/share/applications/rusted-paratrooper.desktop
}

sha256sums=('577401982c25cd82c8df284e9fa53efacf7b835bca54840d93fda89b3f9b8af2'
            '998f94879719990106179c0cdd454caad6f49ab44464afa6a332bb88d1abf62b'
            '2b9c2d9de8965c257d4cb6c3705b07d4e9252945c2269400adc8c08207a773c1')
