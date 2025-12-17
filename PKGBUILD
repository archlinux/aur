# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="pev2-web"
pkgver=1.19.0
pkgrel=1
pkgdesc="Postgres Explain Visualizer 2"
url="https://explain.dalibo.com/"
license=("PostgreSQL")
arch=("any")
source=("$pkgname-$pkgver.html::https://github.com/dalibo/pev2/releases/download/v$pkgver/pev2.html"
        "https://raw.githubusercontent.com/dalibo/pev2/refs/heads/master/LICENSE")
b2sums=('f28edc72ebf3f86f7601d20a99a6ebb97dcbac13843000b72e6bd70cd53afbd78df1235a4be2057069a0a9fb4be6da1a29e5fa14083bfb65ffc93e1140b87521'
        'dbabc6d909305cc05b984a68381ab7fba91968113359b6916bd0565e9f352c720e5d95146525642307608011315ea332d03d5127ff934f9be9c32f0bb2811559')

package(){
 install -D -m 644 "$pkgname-$pkgver.html" "$pkgdir/usr/share/webapps/pev2/index.html"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/pev2/LICENSE"
}

