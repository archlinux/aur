# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
pkgname=ydb-cli-bin
pkgver=2.11.0
pkgrel=1
pkgdesc='YDB CLI is the client-side command line interface for YDB databases.'
arch=('x86_64')
url='https://ydb.tech/en/docs/reference/ydb-cli/'
license=('Apache')
makedepends=('curl')

YDB_STORAGE_URL='https://storage.yandexcloud.net/yandexcloud-ydb'

source=("ydb-${pkgver}::${YDB_STORAGE_URL}/release/${pkgver}/linux/amd64/ydb")
sha256sums=('5671c625fac9fa1cb7f2edad8470aa437858f964bf78d74d4edda6b1ab21dea9')

package() {
    install -D "${srcdir}/ydb-${pkgver}" "${pkgdir}/usr/bin/ydb"
}
