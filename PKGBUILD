# Maintainer:    mzwing <mzwing@mzwing.eu.org>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor:   Henry-ZHR <henry-zhr@qq.com>

_pkgname=serenity
pkgname=serenity-bin
_pkgver='1.1.0-beta.3'
pkgver=1.1.0beta.3
pkgrel=1
pkgdesc='The configuration generator for sing-box'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/SagerNet/serenity'
license=('custom:GPL-3.0-or-later WITH name use or association addition')
optdepends=('sing-box')
provides=('serenity')
conflicts=('serenity' 'serenity-git')
backup=("etc/$_pkgname/config.json")
source=("LICENSE"::$url/raw/dev/LICENSE)
source_i686=("${_pkgname}_${_pkgver}_i686.tar.zst::$url/releases/download/v$_pkgver/${_pkgname}_${_pkgver}_linux_386.pkg.tar.zst")
source_x86_64=("${_pkgname}_${_pkgver}_x86_64.tar.zst::$url/releases/download/v$_pkgver/${_pkgname}_${_pkgver}_linux_amd64.pkg.tar.zst")
source_aarch64=("${_pkgname}_${_pkgver}_aarch64.tar.zst::$url/releases/download/v$_pkgver/${_pkgname}_${_pkgver}_linux_arm64.pkg.tar.zst")
source_armv7h=("${_pkgname}_${_pkgver}_armv7h.tar.zst::$url/releases/download/v$_pkgver/${_pkgname}_${_pkgver}_linux_armv7.pkg.tar.zst")
sha256sums=('650d5e3b99a446fb38e820fa87a49562e0c79eab868fff58618ac487a58e554c')
sha256sums_i686=('941c7ca18c4634ff2abbf76f07f6ed764bdab52bd61bdfdc0b8736fa8b582742')
sha256sums_x86_64=('76c90048247f03382f3316d63cabd934c8d0bc2d22a308661c2fe2f90dc11c21')
sha256sums_aarch64=('519f44a26dc921edcf083af38be8a7f1acde8139f577757ce92bb64cc18e7598')
sha256sums_armv7h=('4ed71b36b8a3039e6ffecb289f5e5a9036bbc18155056250aca06039a713197e')

package() {
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
    cp -dpr --no-preserve=ownership "$srcdir/usr/" "$pkgdir/usr"
    cp -dpr --no-preserve=ownership "$srcdir/etc/" "$pkgdir/etc"
}
