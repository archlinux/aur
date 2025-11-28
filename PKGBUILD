# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-flatpak
pkgver=202511271
pkgrel=1
pkgdesc="Phoenix is a suite of configurations & advanced modifications for Mozilla Firefox, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL-3.0-or-later')
url="https://phoenix.celenity.dev"
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/celenityy/Phoenix/-/raw/5b5375277a9596d66b7d38f03fb7d6729831a072/archives/phoenix-flatpak.zip")
sha512sums=('f82fa1f679904c769dc4ef5491db7f83814d4b6c71f7ca09cc7846614a42ff10d80a88cb81d8512b3a114222b21f962d7435efd69dbb123d45b7e7c6cf7d7e02')
makedepends=('unzip')

pkgver() {
    echo "$pkgver"
}

package() {
    local tmpdir=$(mktemp -d)

    unzip "$srcdir/${pkgname}-${pkgver}.zip" -d "$tmpdir"

    install -Dm644 "$tmpdir/assets/about/attribution.css" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/assets/about/attribution.css"
    install -Dm644 "$tmpdir/assets/about/attribution.html" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/assets/about/attribution.html"
    install -Dm644 "$tmpdir/assets/about/phoenix.css" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/assets/about/phoenix.css"
    install -Dm644 "$tmpdir/assets/about/phoenix.html" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/assets/about/phoenix.html"
    install -Dm644 "$tmpdir/assets/phoenix.png" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/assets/phoenix.png"
    install -Dm644 "$tmpdir/assets/spec-welcome.txt" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/assets/spec-welcome.txt"
    install -Dm644 "$tmpdir/configs/apple-maps.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/apple-maps.cfg"
    install -Dm644 "$tmpdir/configs/discord.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/discord.cfg"
    install -Dm644 "$tmpdir/configs/element.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/element.cfg"
    install -Dm644 "$tmpdir/configs/google-maps.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/google-maps.cfg"
    install -Dm644 "$tmpdir/configs/hardened.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/hardened.cfg"
    install -Dm644 "$tmpdir/configs/photopea.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/photopea.cfg"
    install -Dm644 "$tmpdir/configs/twitter.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/twitter.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/apple-maps.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/apple-maps.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/discord.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/discord.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/element.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/element.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/google-maps.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/google-maps.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/hardened.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/hardened.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/photopea.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/photopea.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/twitter.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/twitter.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/youtube.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/youtube.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/youtube-music.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/youtube-music.cfg"
    install -Dm644 "$tmpdir/configs/youtube.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/youtube.cfg"
    install -Dm644 "$tmpdir/configs/youtube-music.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/youtube-music.cfg"
    install -Dm644 "$tmpdir/defaults/pref/phoenix-desktop.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/defaults/pref/phoenix-desktop.js"
    install -Dm644 "$tmpdir/phoenix.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/lib/firefox/phoenix.cfg"
    install -Dm644 "$tmpdir/policies/policies.json" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/policies/policies.json"
    install -Dm644 "$tmpdir/userjs/apple-maps/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/apple-maps/user.js"
    install -Dm644 "$tmpdir/userjs/discord/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/discord/user.js"
    install -Dm644 "$tmpdir/userjs/element/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/element/user.js"
    install -Dm644 "$tmpdir/userjs/extended/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/extended/user.js"
    install -Dm644 "$tmpdir/userjs/google-maps/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/google-maps/user.js"
    install -Dm644 "$tmpdir/userjs/photopea/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/photopea/user.js"
    install -Dm644 "$tmpdir/userjs/README.md" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/README.md"
    install -Dm644 "$tmpdir/userjs/twitter/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/twitter/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/apple-maps/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/apple-maps/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/discord/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/discord/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/element/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/element/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/extended/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/extended/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/google-maps/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/google-maps/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/photopea/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/photopea/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/twitter/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/twitter/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/youtube/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/youtube/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/youtube-music/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/youtube-music/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix-base/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix-base/user.js"
    install -Dm644 "$tmpdir/userjs/youtube/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/youtube/user.js"
    install -Dm644 "$tmpdir/userjs/youtube-music/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/youtube-music/user.js"
    install -Dm644 "$tmpdir/COPYING.txt" "$pkgdir/usr/share/doc/phoenix-flatpak/COPYING.txt"
    install -Dm644 "$tmpdir/README.md" "$pkgdir/usr/share/doc/phoenix-flatpak/README.md"

    rm -rf "$tmpdir"
}
