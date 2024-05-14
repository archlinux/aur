# Maintainer: Petrus <petrus@dismail.de>

pkgname=mailctl-bin
_pkgname="${pkgname%-bin}"
pkgver=99.9
pkgrel=3
pkgdesc="Provide OAuth2 renewal and authorization capabilities"
arch=(x86_64 aarch64)
url="https://github.com/pdobsan/${_pkgname}"
license=('BSD')
groups=()
depends=(gnupg)
makedepends=()
optdepends=(
            'msmtp: an SMTP client'
            'fdm: fetch and deliver mail'
            'cronie: cron daemon to execute scheduled commands'
            'pass: stores, retrieves, generates, and synchronizes passwords securely'
            'gnome-keyring: Stores passwords and encryption keys'
           )
provides=(${_pkgname})
conflicts=(oama oama-bin ${_pkgname} ${_pkgname}-git)
release=$_pkgname-$pkgver-Linux

sosurce=(Deprecation.txt)

install=.INSTALL

package() {
	echo doing nothing ...
	echo ... nothing changed.
	exit 1
}
