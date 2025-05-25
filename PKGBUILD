# Maintainer: futpib <futpib@gmail.com>

pkgname=acli-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Atlassian CLI - Official command line tool for Atlassian Cloud products"
arch=('x86_64' 'aarch64')
url="https://developer.atlassian.com/cloud/acli/"
license=('custom')
provides=('acli')
conflicts=('acli')

source_x86_64=("https://acli.atlassian.com/linux/latest/acli_linux_amd64/acli")
source_aarch64=("https://acli.atlassian.com/linux/latest/acli_linux_arm64/acli")

sha256sums_x86_64=('742b121d8077036d8cf3d874cb94a363c1c9ca987d9b9afb703a4a0f5e82af8e')
sha256sums_aarch64=('742b121d8077036d8cf3d874cb94a363c1c9ca987d9b9afb703a4a0f5e82af8e')

package() {
    install -Dm755 "acli" "$pkgdir/usr/bin/acli"
}
