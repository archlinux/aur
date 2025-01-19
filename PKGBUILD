# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-arch
pkgver=202501191
pkgrel=1
pkgdesc="Phoenix is a suite of configurations & advanced modifications for Mozilla Firefox, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=("https://codeberg.org/celenity/Phoenix/raw/commit/dac32ca98b9c42f411a2f0b16d0d66a857849cb2/archives/phoenix.zip")
sha512sums=('63aea3ab6c49a8dba2d92b203e0392d4313fac177508b113c37bdcebd705abe81523aed982593fec08d07aa0cf47af8bd9357ea4307d025fd52915d34142b36f')

pkgver() {
    echo "$pkgver"
}

package() {
    local tmpdir=$(mktemp -d)

    unzip "$srcdir/phoenix.zip" -d "$tmpdir"

    install -Dm644 "$tmpdir/filter.pac" "$pkgdir/etc/firefox/phoenix/resources/filter.pac"
    install -Dm644 "$tmpdir/configs/discord.cfg" "$pkgdir/etc/firefox/phoenix/configs/discord.cfg"
    install -Dm644 "$tmpdir/configs/element.cfg" "$pkgdir/etc/firefox/phoenix/configs/element.cfg"
    install -Dm644 "$tmpdir/configs/hardened.cfg" "$pkgdir/etc/firefox/phoenix/configs/hardened.cfg"
    install -Dm644 "$tmpdir/configs/hardened-no-sync.cfg" "$pkgdir/etc/firefox/phoenix/configs/hardened-no-sync.cfg"
    install -Dm644 "$tmpdir/configs/no-sync.cfg" "$pkgdir/etc/firefox/phoenix/configs/no-sync.cfg"
    install -Dm644 "$tmpdir/configs/twitter.cfg" "$pkgdir/etc/firefox/phoenix/configs/twitter.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix.cfg" "$pkgdir/etc/firefox/phoenix/configs/ui-fix.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/discord.cfg" "$pkgdir/etc/firefox/phoenix/configs/ui-fix/discord.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/element.cfg" "$pkgdir/etc/firefox/phoenix/configs/ui-fix/element.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/hardened.cfg" "$pkgdir/etc/firefox/phoenix/configs/ui-fix/hardened.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/hardened-no-sync.cfg" "$pkgdir/etc/firefox/phoenix/configs/ui-fix/hardened-no-sync.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/no-sync.cfg" "$pkgdir/etc/firefox/phoenix/configs/ui-fix/no-sync.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/twitter.cfg" "$pkgdir/etc/firefox/phoenix/configs/ui-fix/twitter.cfg"
    install -Dm644 "$tmpdir/configs/ui-fix/youtube.cfg" "$pkgdir/etc/firefox/phoenix/configs/ui-fix/youtube.cfg"
    install -Dm644 "$tmpdir/configs/youtube.cfg" "$pkgdir/etc/firefox/phoenix/configs/youtube.cfg"
    install -Dm644 "$tmpdir/defaults/pref/phoenix.js" "$pkgdir/etc/firefox/defaults/pref/phoenix.js"
    install -Dm644 "$tmpdir/etc/profile.d/phoenix-env-overrides.sh" "$pkgdir/etc/profile.d/phoenix-env-overrides.sh"
    install -Dm644 "$tmpdir/phoenix.cfg" "$pkgdir/usr/lib/firefox/phoenix.cfg"
    install -Dm644 "$tmpdir/policies.json" "$pkgdir/etc/firefox/policies/policies.json"
    install -Dm644 "$tmpdir/userjs/linux/discord/user.js" "$pkgdir/etc/firefox/phoenix/userjs/discord/user.js"
    install -Dm644 "$tmpdir/userjs/linux/element/user.js" "$pkgdir/etc/firefox/phoenix/userjs/element/user.js"
    install -Dm644 "$tmpdir/userjs/linux/hardened/user.js" "$pkgdir/etc/firefox/phoenix/userjs/hardened/user.js"
    install -Dm644 "$tmpdir/userjs/linux/hardened-no-sync/user.js" "$pkgdir/etc/firefox/phoenix/userjs/hardened-no-sync/user.js"
    install -Dm644 "$tmpdir/userjs/linux/no-sync/user.js" "$pkgdir/etc/firefox/phoenix/userjs/no-sync/user.js"
    install -Dm644 "$tmpdir/userjs/linux/twitter/user.js" "$pkgdir/etc/firefox/phoenix/userjs/twitter/user.js"
    install -Dm644 "$tmpdir/userjs/linux/ui-fix/discord/user.js" "$pkgdir/etc/firefox/phoenix/userjs/ui-fix/discord/user.js"
    install -Dm644 "$tmpdir/userjs/linux/ui-fix/element/user.js" "$pkgdir/etc/firefox/phoenix/userjs/ui-fix/element/user.js"
    install -Dm644 "$tmpdir/userjs/linux/ui-fix/hardened/user.js" "$pkgdir/etc/firefox/phoenix/userjs/ui-fix/hardened/user.js"
    install -Dm644 "$tmpdir/userjs/linux/ui-fix/hardened-no-sync/user.js" "$pkgdir/etc/firefox/phoenix/userjs/ui-fix/hardened-no-sync/user.js"
    install -Dm644 "$tmpdir/userjs/linux/ui-fix/no-sync/user.js" "$pkgdir/etc/firefox/phoenix/userjs/ui-fix/no-sync/user.js"
    install -Dm644 "$tmpdir/userjs/linux/ui-fix/twitter/user.js" "$pkgdir/etc/firefox/phoenix/userjs/ui-fix/twitter/user.js"
    install -Dm644 "$tmpdir/userjs/linux/ui-fix/youtube/user.js" "$pkgdir/etc/firefox/phoenix/userjs/ui-fix/youtube/user.js"
    install -Dm644 "$tmpdir/userjs/linux/ui-fix-base/user.js" "$pkgdir/etc/firefox/phoenix/userjs/ui-fix-base/user.js"
    install -Dm644 "$tmpdir/userjs/linux/youtube/user.js" "$pkgdir/etc/firefox/phoenix/userjs/youtube/user.js"
    install -Dm644 "$tmpdir/README.md" "$pkgdir/usr/share/doc/phoenix/README.md"

    rm -rf "$tmpdir"
}
