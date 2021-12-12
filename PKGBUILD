# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=goful-bin
pkgdesc='Goful is a CUI file manager written in Go'
pkgver=0.2.1
pkgrel=1
url='https://github.com/anmitsu/goful'
arch=('i686' 'x86_64' 'aarch64')
license=('MIT')
makedepends=()
depends=()
_source_prefix="https://github.com/anmitsu/goful/releases/download/v$pkgver/goful_linux_"
source_x86_64=("${_source_prefix}x86_64.tar.gz")
source_aarch64=("${_source_prefix}arm64.tar.gz")
source_i686=("${_source_prefix}i386.tar.gz")
b2sums_i686=('abfdf15e32d57c57b2a23ae13a2b671724ca03d63f844e459ee7c55cfbb1127a92ccf176d8755b7ca07572b80b0f1ad1b012a58f5a88fa89f8da280160f9990a')
b2sums_x86_64=('ec89e220b3fbd43042e86fc36b9e3a154290d35e09d48d7817bdc1034e2bb397184dbe5433470fe4133a9907cc2e142ae00959c66c65b6c8100614fbfb25aade')
b2sums_aarch64=('6028369d9f97520babba5bdc81574908d4c2da4bdb2403dea8b56efd7d7284442252a472c004fdcfd77303955694802097dcf760d33e82c8b9e156ab5f98ce8c')

package(){
    install -Dm755 "$srcdir/goful" "$pkgdir/usr/bin/gofu"
    install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
