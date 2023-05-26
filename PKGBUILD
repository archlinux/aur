# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
pkgname=ydb-cli-bin
pkgver=2.4.0
pkgrel=1
pkgdesc='YDB CLI is the client-side command line interface for YDB databases.'
arch=('x86_64')
url='https://ydb.tech/en/docs/reference/ydb-cli/'
license=('Apache')
makedepends=('curl')

YDB_STORAGE_URL='https://storage.yandexcloud.net/yandexcloud-ydb'

source=("ydb-${pkgver}::${YDB_STORAGE_URL}/release/${pkgver}/linux/amd64/ydb")
sha256sums=('625bafc1288ce53ace0a52843f79e0b60f3a55bd5573dbf4d07a179ffb6c68c7')

package() {
    install -D "${srcdir}/ydb-${pkgver}" "${pkgdir}/usr/bin/ydb"
}
