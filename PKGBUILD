# Maintainer: Alejandro Quisbert <alejandropqc at protonmail dot com>

pkgname=mongosh-bin
_pkgname=mongosh
pkgver=1.0.5
pkgrel=2
pkgdesc='An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.'
arch=('x86_64' 'aarch64')
depends=('xz' 'krb5')
url='https://github.com/mongodb-js/mongosh.git'
license=('Apache')
_mongosh_file=mongosh-${pkgver}-linux-x64

source_x86_64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-x64.tgz")
sha256sums_x86_64=('0e47c60e99dbfb2cc55696a384bd8d23e03df0026ea629e27ceef40e7f0d1770')
source_aarch64=("https://downloads.mongodb.com/compass/${_pkgname}-${pkgver}-linux-arm64.tgz")
sha256sums_aarch64=('21aa0655de4af6eeb01e4d8019f7cebbb7fa24743a3092d2f4628a92d5a0811b')

package() {

    install -D $_mongosh_file/bin/mongocryptd-mongosh "$pkgdir/usr/bin/mongocryptd-mongosh"
    install -D $_mongosh_file/bin/mongosh "$pkgdir/usr/bin/mongosh"

}
