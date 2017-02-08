# Contributor: Jonathan Wiersma <archaur at jonw dot org>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=eclipse-jsonedit
pkgver=1.0.1
pkgrel=1
pkgdesc="Eclipse JSON Editor Plugin"
arch=('i686' 'x86_64')
url="https://github.com/boothen/Json-Eclipse-Plugin"
license=('EPL')
depends=("eclipse" "eclipse-antlr4-runtime")
noextract=(
	jsonedit-feature_1.0.1.jar
	jsonedit-core_1.0.1.jar
	jsonedit-folding_1.0.1.jar
	jsonedit-model_1.0.1.jar
	jsonedit-outline_1.0.1.jar
	jsonedit-preferences_1.0.1.jar
	jsonedit-text_1.0.1.jar
	jsonedit-editor_1.0.1.jar
)
source=(
	"http://boothen.github.io/Json-Eclipse-Plugin/features/jsonedit-feature_1.0.1.jar"
	"http://boothen.github.io/Json-Eclipse-Plugin/plugins/jsonedit-core_1.0.1.jar"
	"http://boothen.github.io/Json-Eclipse-Plugin/plugins/jsonedit-folding_1.0.1.jar"
	"http://boothen.github.io/Json-Eclipse-Plugin/plugins/jsonedit-model_1.0.1.jar"
	"http://boothen.github.io/Json-Eclipse-Plugin/plugins/jsonedit-outline_1.0.1.jar"
	"http://boothen.github.io/Json-Eclipse-Plugin/plugins/jsonedit-preferences_1.0.1.jar"
	"http://boothen.github.io/Json-Eclipse-Plugin/plugins/jsonedit-text_1.0.1.jar"
	"http://boothen.github.io/Json-Eclipse-Plugin/plugins/jsonedit-editor_1.0.1.jar"
)
md5sums=(
        '449d269e8ba13722b901dc6775bf5b89'
	'3e8821bee7bdd7107762b6dd7fa2881e'
        '6053661ee76a900311b5ef51d04bec2f'
        'fe413155c99392256254460aa67d1d36'
        'c66400e728da9de7d1e0647ce79ba878'
        'bcdabc0abecabec3270eba6189bd7718'
        '259cf7de6e7a3feebb6c1181c0777552'
        '98e95e96e29bf7c87b415e3006dc29ba'
)

package() {
    install -d "$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/features"
    install -m644 "$srcdir/jsonedit-feature_1.0.1.jar" \
    	"$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/features"

    install -d "$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins"
    install -m644 "$srcdir/jsonedit-core_1.0.1.jar" \
    	"$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins"
    install -m644 "$srcdir/jsonedit-folding_1.0.1.jar" \
    	"$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins"
    install -m644 "$srcdir/jsonedit-model_1.0.1.jar" \
    	"$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins"
    install -m644 "$srcdir/jsonedit-outline_1.0.1.jar" \
    	"$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins"
    install -m644 "$srcdir/jsonedit-preferences_1.0.1.jar" \
    	"$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins"
    install -m644 "$srcdir/jsonedit-text_1.0.1.jar" \
    	"$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins"
    install -m644 "$srcdir/jsonedit-editor_1.0.1.jar" \
    	"$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins"
}
