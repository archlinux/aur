# Maintainer: Felix Schindler <aur at felixschindler dot net>

pkgname=suexec
pkgver=0.2
pkgrel=1
pkgdesc="switch user and group id and exec"
url=https://github.com/ncopa/su-exec
license=('custom')
source=("https://github.com/ncopa/su-exec/archive/v0.2.zip")
md5sums=('a082c06cd0471eeb905ee323ae2ec2c2')
arch=('i686' 'x86_64')
makedepends=('gcc')

build() {
        cd su-exec-0.2
        make
}

package() {
        cd su-exec-0.2
        install -D -m755 su-exec ${pkgdir}/usr/bin/su-exec
        install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

