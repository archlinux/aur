# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=gextant
pkgname="$_pkgbase-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc='Updates GNOME Shell extensions from their repositories'
arch=('x86_64')
url='https://github.com/AperteDev/gextant'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.7' 'libsecret' 'glib2' 'ca-certificates' 'libgcc' 'glibc')
optdepends=('org.freedesktop.secrets: keep the access tokens in the system keyring')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source_x86_64=("$_pkgbase-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-$pkgver-x86_64.tar.gz")
noextract=("$_pkgbase-$pkgver-x86_64.tar.gz")
sha256sums_x86_64=('2f15199dc4837f896c46aca2f856a5fab01c5e37f17b86bc7f9a995981efdb04')

package() {
	bsdtar -xf "$_pkgbase-$pkgver-x86_64.tar.gz" -C "$pkgdir" --no-same-owner
}
