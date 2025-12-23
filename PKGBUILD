pkgname=password-generator
pkgver=0.1.2
pkgrel=1
pkgdesc="UI tool that creates unique and random passwords"
arch=('x86_64')
url='https://github.com/denix666/password-generator'
license=('MIT')

source=('https://github.com/denix666/password-generator/releases/download/v0.1.2/password-generator_linux_x86_64.tar.gz'
	'password-generator.png'
	'password-generator.desktop')

package() {
    cd ${srcdir}
    install -D -m755 password-generator ${pkgdir}/usr/bin/password-generator
    install -D -m644 password-generator.png ${pkgdir}/usr/share/pixmaps/password-generator.png
    install -D -m644 password-generator.desktop ${pkgdir}/usr/share/applications/password-generator.desktop
}
sha256sums=('fd5545ab19ae0f5d5c26d4767d8e386ec52f885057115d75927f01ceb555b438'
            '3773a0cd9821b818140d54a77c897baef5581fb1179ae4e7bfc35ef7fef60dbc'
            '1a5314ec32d8b6350cdd5e0057b5012d09d8e74da5355ce649c4ef7dc374d996')
