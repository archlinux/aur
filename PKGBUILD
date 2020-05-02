# Maintainer: katt <magunasu.b97@gmail.com>

_pkgname=shellcheck
pkgname="$_pkgname-bin"
pkgver=0.7.1
pkgrel=1
url='https://shellcheck.net'
pkgdesc='Shell script analysis tool (binary release)'
license=('AGPL3')
arch=('x86_64' 'armv6h' 'aarch64')
conflicts=("$_pkgname")
provides=("$_pkgname")

source_x86_64=("https://github.com/koalaman/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver.linux.x86_64.tar.xz")
source_armv6h=("https://github.com/koalaman/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver.linux.armv6hf.tar.xz")
source_aarch64=("https://github.com/koalaman/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver.linux.aarch64.tar.xz")

sha512sums_x86_64=('beca3d7819a6bdcfbd044576df4fc284053b48f468b2f03428fe66f4ceb2c05d9b5411357fa15003cb0311406c255084cf7283a3b8fce644c340c2f6aa910b9f')
sha512sums_armv6h=('7d8fd04a7b3b7291b3f6236ad15ee1d06a893b7e878b944e22dad1c16d627b583d72d489cccbdfbb4915f85d456e3c72a39ec83c98e31a901c104c8f59f59bf7')
sha512sums_aarch64=('0068c11477aa7166d0940934ad0e8e243788e1626f080cd57974b03bc4c75581918e50341364e02d0e69ebb21c8c0d063e729ddc7db0a8d0543e7a0188781b6e')


package() {
    install -D -m0755 "$_pkgname-v$pkgver/$_pkgname" "${pkgdir}/usr/bin/$_pkgname" 
}
