# Maintainer: David Govea <govea.du@gmail.com>
# Contributor: Daniel Wyatt <Daniel.Wyatt@gmail.com>

pkgname=hackhands-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="An easy and convenient way to get notified and connect to requests on hackhands.com"
arch=('x86_64')
url='https://hackhands.com'
license=('custom')
depends=('bash-completion'
         'desktop-file-utils'
         'gconf'
         'gtk2'
         'gvfs'
         'hicolor-icon-theme'
         'libappindicator-gtk2'
         'libnotify'
         'libsystemd'
         'libxtst'
         'nss'
         'xdg-utils')
optdepends=('gnome-keyring' 'libgnome-keyring')
options=('!strip')
source_x86_64=("https://packagecloud.io/hackhands/desktop/packages/ubuntu/xenial/hackhands_${pkgver}_amd64.deb/download")
sha256sums_x86_64=('c6ca321d8fcbf6c70b194f7c8ad5f08957e0daa89bc7170a9f3936831cf57519')

prepare() {
  tar -xJf data.tar.xz
}

package() {
  cp -r "$srcdir/usr" "$pkgdir"
  cp -r "$srcdir/opt" "$pkgdir"
}

# vim:set ts=2 sw=2 et:
