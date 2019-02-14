# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=systemd-sudo-variables
pkgver=1.0.0
pkgrel=1
pkgdesc='Rules for propagating SYSTEMD and LESS environment variables with sudo.'
arch=('any')
url='https://aur.archlinux.org/packages/systemd-sudo-variables'
license=('custom:Public Domain')
depends=('sudo')
source=(systemd.sudoers)
sha256sums=('2e4e2a6ac15320c86056128c62f9d2e7f22cc8f57f6d6c589d2adb0d914f6231')

package() {
  install -dm750 "$pkgdir/etc/sudoers.d"
  install -m400 systemd.sudoers "$pkgdir/etc/sudoers.d/systemd"
}

