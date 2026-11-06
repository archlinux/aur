# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=foldav
pkgname="$_pkgbase-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc='A file manager for the files in your Nextcloud'
arch=('x86_64')
url='https://github.com/AperteDev/foldav'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.8' 'libsecret' 'sqlite' 'glib2' 'libgcc' 'glibc')
optdepends=('gnome-online-accounts: sign in with a GNOME Online Accounts account'
            'org.freedesktop.secrets: keep the passwords in the system keyring')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source_x86_64=("$_pkgbase-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-$pkgver-x86_64.tar.gz")
noextract=("$_pkgbase-$pkgver-x86_64.tar.gz")
sha256sums_x86_64=('cf10462cfbad8a63b3aa4c9ab97e20848eae4f00f4855141da79783ddedb6c52')

package() {
	bsdtar -xf "$_pkgbase-$pkgver-x86_64.tar.gz" -C "$pkgdir" --no-same-owner
}
