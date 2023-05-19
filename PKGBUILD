# Maintainer: Romain Gallet <rgallet@grumlimited.co.uk>
# Contributor: Romain Gallet <rgallet@grumlimited.co.uk>
_packager="Romain Gallet <rgallet@grumlimited.co.uk>"
_deb_pkgname=authenticator-rs
pkgname=$_deb_pkgname-bin
md5sums=('7219db3aa55d4ef78bb8d4cc32810a9a')
pkgver=0.7.4
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
