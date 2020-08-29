# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Dieter Hsu <xlk1982@gmail.com>

pkgname=eclipse-markdown
pkgver=1.2.0
_date=201501260515
pkgrel=1
pkgdesc="Markdown editor plugin for Eclipse - outline, folding, formatting, HTML export & preview"
arch=('any')
url="http://www.winterwell.com/software/markdown-editor.php"
license=('GPL2')
depends=('eclipse-platform')
source=(https://github.com/winterstein/Eclipse-Markdown-Editor-Plugin/releases/download/$pkgver/markdown.editor.site-$pkgver-$_date.zip)
md5sums=('36fd61ad6cdff8236fa9a9a95ce2f4d6')

package() {
    _dest="$pkgdir/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse"
    mkdir -p $_dest/{plugins,features}
    install -Dm644 plugins/winterwell.markdown_$pkgver.$_date.jar $_dest/plugins/winterwell.markdown_$pkgver.$_date.jar
    install -Dm644 features/markdown.editor.feature_$pkgver.$_date.jar $_dest/features/markdown.editor.feature_$pkgver.$_date.jar
}
