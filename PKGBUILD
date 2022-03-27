# Maintainer: Alejandro Quisbert <alejandropqc at protonmail dot com>

pkgname=mongosh-bin
_pkgname=mongosh
pkgver=1.3.1
pkgrel=1
pkgdesc='An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.'
arch=('x86_64' 'aarch64')
depends=('xz' 'krb5')
url='https://github.com/mongodb-js/mongosh.git'
license=('Apache')
_mongosh_file=mongosh-${pkgver}-linux-x64

source_x86_64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-x64.tgz")
sha256sums_x86_64=('4371f3af3436009db3ab34face0908592b330e2f9938dbbd91dace4832315d08')
source_aarch64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-arm64.tgz")
sha256sums_aarch64=('65d83d618c3da8cbfee643bc024d1fd638c9178fbd669e9eaccbe846fa6034cf')

package() {

    install -D $_mongosh_file/bin/mongocryptd-mongosh "$pkgdir/usr/bin/mongocryptd-mongosh"
    install -D $_mongosh_file/bin/mongosh "$pkgdir/usr/bin/mongosh"

}
