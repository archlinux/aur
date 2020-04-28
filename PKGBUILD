# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
pkgname=phoneinfoga-latest-bin
_release="$(curl https://github.com/sundowndev/PhoneInfoga/releases/latest 2>/dev/null | sed 's:.*/releases/tag/v\([0-9]\+.[0-9]\+.[0-9]\+\).*:\1:')"
pkgver=2.0.8
pkgrel=1
pkgdesc="Advanced information gathering & OSINT framework for phone numbers. (latest bin release)"
arch=('x86_64')
url="https://sundowndev.github.io/PhoneInfoga/"
license=('GPL')
conflicts=('phoneinfoga')
source=("https://github.com/sundowndev/PhoneInfoga/releases/download/v$_release/PhoneInfoga_Linux_x86_64.tar.gz")
md5sums=('SKIP')

pkgver() {
    echo "$_release"       
}

package() {
    install -Dm755 "phoneinfoga" "$pkgdir/usr/bin/phoneinfoga"
}

