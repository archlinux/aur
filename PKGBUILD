# Maintainer: Romain Gallet <gr211 at users.noreply.github.com>
# Contributor: Romain Gallet <gr211 at users.noreply.github.com>
_packager="Romain Gallet <gr211 at users.noreply.github.com>"
_deb_pkgname=authenticator-rs
pkgname=$_deb_pkgname-bin
md5sums=('8b8da541b313d0b6f5a264f3326db09c')
pkgver=0.8.4
pkgrel=1
pkgdesc='MFA Authenticator. TOTP-MFA application written in Rust and GTK3.'
arch=('x86_64')
url="https://github.com/grumlimited/authenticator-rs"
license=('GPL3')
groups=()
depends=('gtk3' 'sqlite' 'gnome-keyring'  'libsecret')
makedepends=()
checkdepends=()
optdepends=()
provides=()
replaces=()
backup=()
options=()
source=("$url/releases/download/$pkgver/authenticator-rs-$pkgver-$arch.deb")
noextract=()

build() {
	rm control.tar.zst
	tar xvf data.tar.zst
}

package() {
	cp -fr usr/ ${pkgdir}
}
