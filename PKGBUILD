# Maintainer: Mohsen Alizadeh <mohsen@alizadeh.us>
#

pkgname=mailtutan-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="a fake smtp server for test and development environments written in Rust"
url="https://github.com/mailtutan/mailtutan"
license=("MIT")
arch=("x86_64")
provides=("mohsen-alizadeh")
conflicts=("mohsen-alizadeh")
source=("https://github.com/manojkarthick/reddsaver/releases/download/v$pkgver/reddsaver-$pkgver-x86_64.tar.gz")
source=("https://github.com/mailtutan/mailtutan/releases/download/v0.2.0/mailtutan-$pkgver-x86_64.tar.gz")
sha256sums=("e9fad48702d5db3131e15dfc5edb5532ad3554eda99e75fc7594f3167b978402")

package() {
    install -Dm755 mailtutan -t "$pkgdir/usr/bin"
}
