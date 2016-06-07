# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hpsmh
pkgver=7.5.2_4
pkgrel=1
pkgdesc="HP System Management Homepage"
arch=(i686 x86_64)
url="http://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(glibc expat pam curl)
groups=(hpproliant)
license=("CUSTOM")
options=(!strip)

source_i686=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/6/i386/current/$pkgname-${pkgver//_/-}.i386.rpm")
source_x86_64=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")

sha256sums_i686=('38ddc41dde635fe8019c26896e83db15e5d656d384c4eb441cabee5b89267492')
sha256sums_x86_64=('7eab8ac0110f7a5edde8e54c907c0ada92211dc3ac557286ffa692102e1c95af')

package() {
	cp -a "$srcdir/"{etc,opt,usr} "$pkgdir"
}
