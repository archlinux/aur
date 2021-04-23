# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=yajsv-bin
_pkgname=yajsv
pkgver=1.4.0
pkgrel=1
pkgdesc="Yet Another CLI JSON Schema Validator"
arch=('x86_64' 'i686')
url="https://github.com/neilpa/yajsv"
license=('MIT')
depends=('glibc')
provides=('yajsv')
conflicts=('yajsv')

source=("$pkgname-$pkgver.LICENSE::https://raw.githubusercontent.com/neilpa/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver.$_pkgname::$url/releases/download/v$pkgver/$_pkgname.linux.amd64")
source_i686=("$pkgname-$pkgver.$_pkgname::$url/releases/download/v$pkgver/$_pkgname.linux.386")
noextract=("$pkgname-$pkgver.LICENSE" "$pkgname-$pkgver.$_pkgname")
sha512sums=('93312901560a0b9ba609957645a8c448c57519606294b925ca3c4141ae024b0889dc165f2662d4a6c4d578f33777d255b5d6c3be10e651d79942208991bf294d')
sha512sums_x86_64=('4b9f40e916193023374f8393dc8d75cf8a0ba0c65d0a84d3d420c03dffd979f749e8db870e60fa92bd1ab525a71e5f4e9850425f6b47cca3f44d73e5cc72d665')
sha512sums_i868=('52cc071b618e366a92f7450c48ed3a9430224669ecf7254afc58ff78bb0836f19221389b5c54f009207c2d1b2295dcfa476851dbdb7a7630b3f1b426627f9ca0')

package() {
  install -Dm755 "$pkgname-$pkgver.$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$pkgname-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
