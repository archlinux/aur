# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-flatpak
pkgver=202508061
pkgrel=1
pkgdesc="Phoenix is a suite of configurations & advanced modifications for Mozilla Firefox, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/celenityy/Phoenix/-/raw/b4e37009ecfa07cc48ffb1142bd4aa0d7d9a12dd/archives/phoenix-flatpak.zip")
sha512sums=('0502c1d65f8d13a4e8fa7c841b969b2fc1b351e7d023954834683b598bc64083bae6157f0735408b66c57f32b4881ef6aa4058db9d57732a88341e104d668a31')
makedepends=('unzip')

pkgver() {
    echo "$pkgver"
}

package() {
    local tmpdir=$(mktemp -d)

    unzip "$srcdir/${pkgname}-${pkgver}.zip" -d "$tmpdir"

    install -Dm644 "$tmpdir/configs/apple-maps.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/apple-maps.cfg"
    install -Dm644 "$tmpdir/configs/discord.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/discord.cfg"
    install -Dm644 "$tmpdir/configs/element.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/element.cfg"
    install -Dm644 "$tmpdir/configs/google-maps.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/google-maps.cfg"
    install -Dm644 "$tmpdir/configs/hardened.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/hardened.cfg"
    install -Dm644 "$tmpdir/configs/twitter.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/twitter.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/apple-maps.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/apple-maps.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/discord.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/discord.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/element.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/element.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/google-maps.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/google-maps.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/hardened.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/hardened.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/twitter.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/twitter.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/youtube.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/ui-fix/youtube.cfg"
    install -Dm644 "$tmpdir/configs/youtube.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs/youtube.cfg"
    install -Dm644 "$tmpdir/defaults/pref/phoenix-desktop.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/defaults/pref/phoenix-desktop.js"
    install -Dm644 "$tmpdir/phoenix.cfg" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/lib/firefox/phoenix.cfg"
    install -Dm644 "$tmpdir/policies/policies.json" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/policies/policies.json"
    install -Dm644 "$tmpdir/userjs/apple-maps/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/apple-maps/user.js"
    install -Dm644 "$tmpdir/userjs/discord/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/discord/user.js"
    install -Dm644 "$tmpdir/userjs/element/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/element/user.js"
    install -Dm644 "$tmpdir/userjs/extended/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/extended/user.js"
    install -Dm644 "$tmpdir/userjs/google-maps/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/google-maps/user.js"
    install -Dm644 "$tmpdir/userjs/twitter/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/twitter/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/apple-maps/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/apple-maps/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/discord/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/discord/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/element/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/element/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/extended/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/extended/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/google-maps/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/google-maps/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/twitter/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/twitter/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix/youtube/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix/youtube/user.js"
    install -Dm644 "$tmpdir/userjs/ui-fix-base/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/ui-fix-base/user.js"
    install -Dm644 "$tmpdir/userjs/youtube/user.js" "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs/youtube/user.js"
    install -Dm644 "$tmpdir/COPYING" "$pkgdir/usr/share/doc/phoenix-flatpak/COPYING"
    install -Dm644 "$tmpdir/README.md" "$pkgdir/usr/share/doc/phoenix-flatpak/README.md"

    rm -rf "$tmpdir"
}
