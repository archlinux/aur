# Contributor: twa022 <twa022@gmail.com>

pkgname=dockbarx-deep-theme
epoch=1
pkgver=20101123
pkgrel=1
pkgdesc="DockBarX Theme"
arch=('any')
url="https://www.deviantart.com/bigrza/art/Deep-theme-for-DockbarX-187183487"
license=('CCPL:cc-by-nc-3.0')
depends=('dockbarx')
groups=('dockbarx-themes')
source=('https://orig00.deviantart.net/54e9/f/2010/327/e/c/deep_theme_for_dockbarx_by_bigrza-d33fzpb.zip')
sha256sums=('98309e84dd7116eef782abdf1b4cd9dd7c71020f9a8443ef0721025620201e32')

package () {
  install -D -m644 "${srcdir}"/Deep.tar.gz "${pkgdir}"/usr/share/dockbarx/themes/deep.tar.gz
}
