#!/bin/bash
# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=yubikey-u2f-udevrules
pkgver=1.0.0
pkgrel=1
pkgdesc="Udev rules to enable you to use the U2F features of your yubikey"
arch=('any')
license=('publicdomain')
url=''
depends=()
conflicts=()
provides=('yubikey-u2f-udevrules')
makedepends=('git')
source=('70-smartcard.rules'
        '70-u2f.rules')
sha256sums=('b0db431dc9aa97041e1ee92a467daf9ccb019cfe71e122322ec277b6568e1645'
            '3eee9d969b9db383d487bd984478ba46898fd88b365510f27796c4dddaed3e4e')

package() {
  install -Dm644 70-smartcard.rules "$pkgdir/etc/udev/rules.d/70-smartcard.rules"
  install -Dm644 70-u2f.rules       "$pkgdir/etc/udev/rules.d/70-u2f.rules"
}


# vim:set ts=2 sw=2 et:
