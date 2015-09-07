# Maintainer: Fink Dennis <dennis.fink@c3l.lu>
pkgname=prosody-mod-pubsub-feeds
pkgver=0.9.8
pkgrel=1
pkgdesc="Subscribe to Atom and RSS feeds over pubsub"
arch=('any')
url="http://hg.prosody.im/prosody-modules/file/tip/mod_pubsub_feeds"
license=('MIT')
depends=('prosody')
source=("http://hg.prosody.im/prosody-modules/raw-file/tip/mod_pubsub_feeds/mod_pubsub_feeds.lua")
sha1sums=('4daa02600074059c9c06221a7591894a59a8a4c3')

package() {
  install -Dm 644 "mod_pubsub_feeds.lua" "${pkgdir}/usr/lib/prosody/modules/mod_pubsub_feeds.lua"
}
