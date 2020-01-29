pkgname='intellij-idea-plugin-emmy-lua'
pkgdesc='Plugin for Intellij IDEA EmmyLua'
url='https://plugins.jetbrains.com/plugin/9768-emmylua'

pkgver='1.3.2.142'
_idea_target='IDEA182'
_plugin_id='9768'
_release_id='76073'
pkgrel=1
arch=('any')
source=("https://plugins.jetbrains.com/files/$_plugin_id/$_release_id/IntelliJ-EmmyLua-$pkgver-$_idea_target.zip")
sha512sums=(11e90674b694ee5c6ed113aaa5738f9996ccd811a0606ac649dab28e8712fa5639eb82d6e13c2f9ad3570bf11687b59895ed121dee546588aaa633135563ced3)

package() {
  cd "$srcdir"

  mkdir -p "${pkgdir}/usr/share/idea/plugins/"
  cp -a "intellij-emmylua" "${pkgdir}/usr/share/idea/plugins/"
}
