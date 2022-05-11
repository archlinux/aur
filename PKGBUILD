# Maintainer: Mirko Rovere <04mirko@libero.it>
# Contributor: koraynilay <koray.fra@gmail.com>

pkgname="extrattor"
pkgver="1.5"
pkgrel="1"
epoch="1"
pkgdesc="A simple bash wrapper to manage one or more archives from the terminal"
arch=("any")
url="https://github.com/Mirko-r/extrattor"
depends=('unarj' 'unace' 'p7zip' 'tar' 'pax' 'gzip' 'unzip' 'xz')
license=("GPL-3.0")
source=("https://github.com/Mirko-r/extrattor/releases/download/1.5/extrattor-1.5.zip")
sha512sums=("SKIP")

package(){
    unzip extrattor-1.5.zip
    echo -e "\nInstalling packages\n"
    
    install -Dm0755 "${srcdir}/extrattor.sh" "${pkgdir}/usr/bin/extrattor"
    install -Dm0755 "${srcdir}/spinner" "${pkgdir}/usr/bin/spinner"
    
    echo -e "\nInstalling man page\n"

    install -Dm0644 "${srcdir}/man/extrattor.1" "$pkgdir/usr/share/man/man1/extrattor.1"
}
