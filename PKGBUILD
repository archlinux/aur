# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=notav
pkgname="$_pkgbase-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc='Notes and a journal kept in your Nextcloud'
arch=('x86_64')
url='https://github.com/AperteDev/notav'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.8' 'gtksourceview5' 'libsecret' 'sqlite' 'glib2' 'libgcc' 'glibc')
optdepends=('gnome-online-accounts: sign in with a GNOME Online Accounts account'
            'org.freedesktop.secrets: keep the passwords in the system keyring')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source_x86_64=("$_pkgbase-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-$pkgver-x86_64.tar.gz")
noextract=("$_pkgbase-$pkgver-x86_64.tar.gz")
sha256sums_x86_64=('768051dc5e712c907c5bcacbad3c0969e83e51c3bc5970d421420aa1c0dca901')

package() {
	bsdtar -xf "$_pkgbase-$pkgver-x86_64.tar.gz" -C "$pkgdir" --no-same-owner
}
