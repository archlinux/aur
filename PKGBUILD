# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=mozilla-firefox-account-server
pkgver=1.108.0
pkgrel=1
pkgdesc="Firefox Accounts authentication server"
arch=('any')
url='https://github.com/mozilla/fxa-auth-server'
license=('MPL2')
depends=('npm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mozilla/fxa-auth-server/archive/v${pkgver}.tar.gz")
sha512sums=('d84885052aa5b7f53098cc3a7b22a0b082123dc4e22c6f5d9c4bca8a79500253b0d90558a2fe29d677ee50776a2161a4e47dcb95b038612851f8c1dbf09ffd21')
optdepends=('mozilla-firefox-sync-server: Mozilla Sync Server for built-in Firefox Sync')

build() {
  cd "fxa-auth-server-${pkgver}"
  npm install
}

package() {
  cd "fxa-auth-server-${pkgver}"
}

# vim: ft=sh syn=sh  ts=2 sw=2 et:
