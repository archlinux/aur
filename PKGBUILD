# Maintainer: Jeroen Langeveld <aur.jeroen@gmail.com
pkgname=tombl-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Easily query TOML files from bash"
arch=('x86_64')
url="https://github.com/snyball/tombl"
license=('GPL3')
provides=("tombl=$pkgver" 'tombl')
source=("https://github.com/snyball/tombl/releases/download/v0.2.3/tombl-v0.2.3.tar.gz")
sha256sums=('f2533c43493520d0db27b889a8e1c20c92fc36143e0e694ab50645c4518c3d80')

package() {
	install -Dm755 "./tombl-v0.2.3/tombl" "${pkgdir}/usr/bin/tombl"
}
