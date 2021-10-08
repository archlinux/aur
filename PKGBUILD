# Maintainer: Alejandro Quisbert <alejandropqc at protonmail dot com>

pkgname=mongosh-bin
_pkgname=mongosh
pkgver=1.1.0
pkgrel=1
pkgdesc='An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.'
arch=('x86_64' 'aarch64')
depends=('xz' 'krb5')
url='https://github.com/mongodb-js/mongosh.git'
license=('Apache')
_mongosh_file=mongosh-${pkgver}-linux-x64

source_x86_64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-x64.tgz")
sha256sums_x86_64=('bed92d26430daba75696e634e8c849a14547a8c61f6e2d37342276b93dc2eb43')
source_aarch64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-arm64.tgz")
sha256sums_aarch64=('6ba158ea70b6e000356854420b020d1a86a295c7d6adb312e8df6b99b74b9989')

package() {

    install -D $_mongosh_file/bin/mongocryptd-mongosh "$pkgdir/usr/bin/mongocryptd-mongosh"
    install -D $_mongosh_file/bin/mongosh "$pkgdir/usr/bin/mongosh"

}
