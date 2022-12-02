# Maintainer: Sofia Talarmo <sofia@teascade.net>
pkgname=pipeswitchd-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Daemon for PipeWire that automatically links audio inputs and outputs based on regular expressions, similar to patchbay."
arch=('x86_64')
url="https://github.com/Teascade/pipeswitch/"
license=('GPL3')
depends=('pipewire')
provides=("pipeswitchd")
conflicts=("pipeswitchd")
source=("${url}/releases/download/v${pkgver}/pipeswitchd.zip")
sha512sums=('fd88f90bb7550d892df79979665749f5a6da823db06d8d49a7e7b37fa5afb0f429bb3e2199dfb7a8b6e667857e569c1d002c06bb44adb7a83befbed9c69ee2af')

package() {
  install -Dm755 "${srcdir}/pipeswitchd" "${pkgdir}/usr/bin/pipeswitchd"
}