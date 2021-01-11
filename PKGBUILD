# Maintainer: lainplus <lainplus at waifu dot club>

_pkgname='toph'
pkgname="${_pkgname}"
pkgver=1.0.0
pkgrel=1
pkgdesc='A minimal and extensible pixel editor'
arch=('x86_64')
url='https://github.com/Dream-Imperium/toph'
license=('unlicense')
depends=('gtk3' 'libxss' 'nss')
provides=("${_pkgname}")
source=("${url}/archive/v1.0.0.tar.gz")
sha256sums=('cd0cdeb804b60022fb96b6831727ebd93513dd2b9d4fb4d42bff9cb3ef65bfd3')

package() {
	tar -xvf v1.0.0.tar.gz -C "${pkgdir}"
	cargo install --locked --path toph-1.0.0
	sudo mv toph-1.0.0/target/release/toph /usr/bin
}


