pkgname=nextcloud-app-richdocumentscode
pkgver=22.5.802
pkgrel=1
pkgdesc="Built-in CODE Server app"
arch=('any')
url="https://github.com/CollaboraOnline/richdocumentscode"
license=('Apache')
depends=('nextcloud>=19' 'nextcloud<26' 'nextcloud-app-richdocuments' 'fontconfig' 'fuse2' 'glibc')
makedepends=()
options=('!strip')
source=("richdocumentscode-${pkgver}.tar.gz::https://github.com/CollaboraOnline/richdocumentscode/releases/download/$pkgver/richdocumentscode.tar.gz")
sha512sums=('dc961bb1e3bdd8faa7b2a4f392a070c692aa454590130f98f6e78c7d53dda87dbca28de9dfee00193e2bebd6c4506c27ff44111718978230c77a2f81319fcb97')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocumentscode" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocumentscode"
}
