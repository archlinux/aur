# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
pkgname=ydb-cli-bin
pkgver=2.35.0
pkgrel=1
pkgdesc='YDB CLI is the client-side command line interface for YDB databases.'
arch=('x86_64')
url='https://ydb.tech/en/docs/reference/ydb-cli/'
license=('Apache')
makedepends=('curl')

YDB_STORAGE_URL='https://storage.yandexcloud.net/yandexcloud-ydb'

source=("ydb-${pkgver}::${YDB_STORAGE_URL}/release/${pkgver}/linux/amd64/ydb")
sha256sums=('6353831b75e905e93b5eaed823f7966107067d91ddb44e301349b163e6ba440f')

package() {
    install -D "${srcdir}/ydb-${pkgver}" "${pkgdir}/usr/bin/ydb"
}
