# Maintainer: Kotz <kotz at getgoogleoff dot me>

pkgname='json2sharp-bin'
pkgver='1.0.1.0'
pkgrel=1
pkgdesc='CLI tool for converting JSON data to class declarations.'
arch=('x86_64' 'aarch64')
url='https://github.com/Kaoticz/Json2Sharp'
license=('Apache-2.0')
provides=('json2sharp')
options=('!strip')
source_x86_64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-x64.zip")
source_aarch64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-arm64.zip")
sha256sums_x86_64=('6344f184ab29c9185462c3f7c11ec44568cdc90b0d265afc64a8ed7e1dad3b12')
sha256sums_aarch64=('c089b147d2a75da8bfc31683506b6247da36ee6ad3b373fca027d1f0d41f6e25')

package()
{
    install -Dm755 "${srcdir}/Json2Sharp_linux-x64/json2sharp" "${pkgdir}/usr/bin/json2sharp"
}
