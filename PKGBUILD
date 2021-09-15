# Maintainer: Alejandro Quisbert <alejandropqc at protonmail dot com>

pkgname=mongosh-bin
_pkgname=mongosh
pkgver=1.0.6
pkgrel=1
pkgdesc='An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.'
arch=('x86_64' 'aarch64')
depends=('xz' 'krb5')
url='https://github.com/mongodb-js/mongosh.git'
license=('Apache')
_mongosh_file=mongosh-${pkgver}-linux-x64

source_x86_64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-x64.tgz")
sha256sums_x86_64=('f16ad0d41bda2d4f0c1768b48101481b091456bd3385b6da31ff27e7666d6fff')
source_aarch64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-arm64.tgz")
sha256sums_aarch64=('ae5e5b72d65f66435651e3a0d9918bdabdd2ccaa984900aacc2a94e20041a660')

package() {

    install -D $_mongosh_file/bin/mongocryptd-mongosh "$pkgdir/usr/bin/mongocryptd-mongosh"
    install -D $_mongosh_file/bin/mongosh "$pkgdir/usr/bin/mongosh"

}
