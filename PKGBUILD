
# Maintainer: Aarav Maloo <aaravmaloo06@gmail.com>

pkgname=blob-bin

pkgver=1.1.0

pkgrel=1

pkgdesc="A minimal note manager that stays out of your way."

arch=('x86_64' 'aarch64')

url="https://github.com/aaravmaloo/blob"

license=('GPL-2.0-only')

provides=('blob')

conflicts=('blob')



source_x86_64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-amd64")

source_aarch64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-arm64")



sha256sums_x86_64=('1a52ec61ec98850e0c182bf7f8bb99d502050e08419a5d0a1a728236628830c2')

sha256sums_aarch64=('23f29bccc922f38af7d889817705df7df2a34a801abdc646e28afee63ca85315')



package() {

    if [ "$CARCH" = "x86_64" ]; then

        install -Dm755 "${srcdir}/blob-linux-amd64" "${pkgdir}/usr/bin/blob"

    else

        install -Dm755 "${srcdir}/blob-linux-arm64" "${pkgdir}/usr/bin/blob"

    fi

}

