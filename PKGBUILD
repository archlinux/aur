# Maintainer: Mohsen Alizadeh <mohsen@alizadeh.us>
#

pkgname=mailtutan-bin
pkgver=0.3.0
pkgrel=1
pkgdesc=" An SMTP server for test and development environments written in Rust "
url="https://github.com/mailtutan/mailtutan"
license=("MIT")
arch=("x86_64")
provides=("mohsen-alizadeh")
conflicts=("mohsen-alizadeh")
source=("https://github.com/mailtutan/mailtutan/releases/download/v$pkgver/mailtutan-$pkgver-x86_64.tar.gz")
sha256sums=("9c1e1e32dba7b36f04148596b11b280fb80c67e79e1ad391867a6eea9509ffdb")

package() {
    install -Dm755 mailtutan -t "$pkgdir/usr/bin"
}
