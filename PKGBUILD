# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="pev2-web"
pkgver=1.25.0
pkgrel=1
pkgdesc="Postgres Explain Visualizer 2"
url="https://explain.dalibo.com/"
license=("PostgreSQL")
arch=("any")
source=("$pkgname-$pkgver.html::https://github.com/dalibo/pev2/releases/download/v$pkgver/pev2.html"
        "https://raw.githubusercontent.com/dalibo/pev2/refs/heads/master/LICENSE")
b2sums=('bdaa90857a95ef92f8dea9c4054a5c41793e588332b975ac528bc59a6370379aa3b6c8a91c242d6397487d21e5f6a9ff526eaa047f65a96e66d712032763868b'
        'dbabc6d909305cc05b984a68381ab7fba91968113359b6916bd0565e9f352c720e5d95146525642307608011315ea332d03d5127ff934f9be9c32f0bb2811559')

package(){
 install -D -m 644 "$pkgname-$pkgver.html" "$pkgdir/usr/share/webapps/pev2/index.html"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/pev2/LICENSE"
}

