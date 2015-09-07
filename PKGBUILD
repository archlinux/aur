# Maintainer: Fink Dennis <dennis.fink@c3l.lu>
pkgname=prosody-mod-pubsub-twitter
pkgver=0.9.8
pkgrel=1
pkgdesc="Subscribe to Twitter search queries over pubsub"
arch=('any')
url="http://hg.prosody.im/prosody-modules/file/tip/mod_pubsub_twitter"
license=('MIT')
depends=('prosody')
source=("http://hg.prosody.im/prosody-modules/raw-file/tip/mod_pubsub_twitter/mod_pubsub_twitter.lua")
sha1sums=('73d1ea0e7a7929f16e4c824daca536eec327d4b9')

package() {
  install -Dm 644 "mod_pubsub_twitter.lua" "${pkgdir}/usr/lib/prosody/modules/mod_pubsub_twitter.lua"
}
