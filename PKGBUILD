# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
pkgname=ydb-cli-bin
pkgver=2.16.0
pkgrel=1
pkgdesc='YDB CLI is the client-side command line interface for YDB databases.'
arch=('x86_64')
url='https://ydb.tech/en/docs/reference/ydb-cli/'
license=('Apache')
makedepends=('curl')

YDB_STORAGE_URL='https://storage.yandexcloud.net/yandexcloud-ydb'

source=("ydb-${pkgver}::${YDB_STORAGE_URL}/release/${pkgver}/linux/amd64/ydb")
sha256sums=('676719e145d9c97b3b52e5191ac3c253b0e578ead52550156f586caf9805cccb')

package() {
    install -D "${srcdir}/ydb-${pkgver}" "${pkgdir}/usr/bin/ydb"
}
