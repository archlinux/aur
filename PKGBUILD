# Maintainer: noahlyk <noahlykins@gmail.com>
pkgname=keymux
pkgver=1.19.0
pkgrel=1
pkgdesc="Keyboard middleware for gaming with low-level input interception"
arch=('x86_64')
url="https://github.com/noahlyk/keymux"
license=('GPL-3.0-or-later')
depends=('udev' 'libevdev')
makedepends=()
optdepends=('systemd: for systemd service files (or use OpenRC/runit scripts)'
            'openrc: for OpenRC init scripts'
            'runit: for runit service directories'
            'rust-wasm: compile steno plugins (rustc with the wasm32-unknown-unknown target)'
            'niri: automatic game mode detection in Niri compositor'
            'hyprland: automatic game mode detection in Hyprland compositor'
            'sway: automatic game mode detection in Sway compositor'
            'i3-wm: automatic game mode detection in i3 window manager'
            'bspwm: automatic game mode detection in bspwm window manager')
options=('!debug' '!lto')
install=keymux.install

source_x86_64=("https://github.com/noahlyk/keymux/releases/download/v${pkgver}/keymux-${pkgver}-x86_64.tar.gz")
source=(
    "LICENSE::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/LICENSE"
    "NOTICE::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/NOTICE"
    "keymux.service::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/systemd/keymux.service"
    "keymux-niri.service::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/systemd/keymux-niri.service"
    "keymux-steno.service::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/systemd/keymux-steno.service"
    "keymux-hyprland.service::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/systemd/keymux-hyprland.service"
    "keymux-sway.service::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/systemd/keymux-sway.service"
    "keymux-i3.service::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/systemd/keymux-i3.service"
    "keymux-bspwm.service::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/systemd/keymux-bspwm.service"
    "openrc-keymux::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/openrc/keymux"
    "openrc-keymux-niri::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/openrc/keymux-niri"
    "openrc-keymux-hyprland::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/openrc/keymux-hyprland"
    "openrc-keymux-sway::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/openrc/keymux-sway"
    "openrc-keymux-i3::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/openrc/keymux-i3"
    "openrc-keymux-bspwm::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/openrc/keymux-bspwm"
    "runit-keymux-run::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/runit/keymux/run"
    "runit-keymux-log-run::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/runit/keymux/log/run"
    "runit-keymux-niri-run::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/runit/keymux-niri/run"
    "runit-keymux-niri-log-run::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/runit/keymux-niri/log/run"
    "runit-keymux-hyprland-run::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/runit/keymux-hyprland/run"
    "runit-keymux-hyprland-log-run::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/runit/keymux-hyprland/log/run"
    "runit-keymux-sway-run::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/runit/keymux-sway/run"
    "runit-keymux-sway-log-run::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/runit/keymux-sway/log/run"
    "runit-keymux-i3-run::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/runit/keymux-i3/run"
    "runit-keymux-i3-log-run::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/runit/keymux-i3/log/run"
    "runit-keymux-bspwm-run::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/runit/keymux-bspwm/run"
    "runit-keymux-bspwm-log-run::https://raw.githubusercontent.com/noahlyk/keymux/v${pkgver}/runit/keymux-bspwm/log/run"
)
# placeholders: the release workflow fills in the real sums (updpkgsums) and refuses to push a SKIP
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'b46bd0961fc585a1e2f79f948cc52ebe0cf0e2740781fd391bf94b531383b566'
            'eb16807e3e33e128c103904aa795c879d89ea5f493089a23930aaf2dd0d56c98'
            '3cf2c1b2ff8277e44c2a9ea75695077ab85660c5beba21926e41af7a01e530d3'
            'a7304399130ad16fdfcd2161781bf582651f03590b39968106fd40be68cdcd47'
            'fe7070257c44742cbda54563a59008d287ba04cd0fe50fbef43a5b0e7a01bf7a'
            '05fc0d770ab6be7283ad6e5b7535bf119438770c9d31b2863a026f91de010d2a'
            'd53cbda5d362470e4e634ff88cdcb1b2e19a86151a092486f0b87c99401f0eef'
            '3ca1dee3ae2908dab49f697b54a006a92f535bab525fdd8d85bf114866f5472a'
            '5057a03d8279dd9e6a61e1cae874c092f23bc41a4ddae7faf9d9414e30bae519'
            '2a03ee53fe71371bf35e70d6c5141f2273e0226143a44dd9b9f0c2723fbd638a'
            'fb388b9a5e2a5b7e8f61b10db66389269579a0c959c2c0f7f835ae81f6fd80ad'
            'fd45430c1db8cfd365511b6b1212c62a4789abfe425687d72e3c68c4b23c534d'
            '9504337b38ad38ac04c0d55be86e12d0726f485b4084cf6aff47cc0b72259f93'
            'ba86e00351508fe423a4682ccfc3803cf1a10762f1174a3c5808c5706ab6df6a'
            'd5ee7d050f79e1f2cd1ae0fd24741640618cb339b3ef8ccb477f122a4ba631b0'
            'dd321b3a1632a99004f74f6bc7bffea3969e073f015c3c9b9a75a33516af630a'
            'da7d15588857397e9eeeb9041374d6408b4968dbe34361629e1153d5a388f2e0'
            '18a5f86bea7274843cf5d6ac6281eaf7928825c637c141751661458e7f197ef3'
            'b9cbdded9024f03441907d01a46db1e2b7d3cdb87352f28324e2ea75165a8304'
            'c8af897f0a85125683276aac18b619505e3430ce4a400f9eaecd00b6ee8b2eb4'
            '5882faad10c8646efe466115718d603502c8ebcb0232d51e0e33e929298eab30'
            'de611b7d3de4629aca11f585e63ef456f1902bbf290fce6b735709c8757eed29'
            '3e4213e7df6d49c9797719ee921bc8b9e620deb9c24ad2e5f0517006605df9f3'
            '4d67b22a10a311481018007eebca44d92c1d882f421f8e2657f0564f52f4b15d'
            '09f1da1dd4e92fb9b8a3ffc6a3794b5aadb824a76adcef233b4aea90dbc5abe5'
            '1ab640288c63ff78bd7941eecc27bde25f2189ee0a7c5bc43e7651710605f83d')
sha256sums_x86_64=('0c5351947f3b38cee9ce83e130038bb6bb2c2a8dac540f12c55c92eb31cc426a')

package() {
    install -Dm755 "$srcdir/keymux" "$pkgdir/usr/bin/keymux"

    # Install systemd services (if systemd is detected)
    if [ -d "/run/systemd/system" ]; then
        install -Dm644 "$srcdir/keymux.service" "$pkgdir/usr/lib/systemd/system/keymux.service"
        # On-screen steno keyboard and tape: any Wayland compositor with layer-shell
        install -Dm644 "$srcdir/keymux-steno.service" "$pkgdir/usr/lib/systemd/user/keymux-steno.service"

        if pacman -Qq niri &>/dev/null; then
            install -Dm644 "$srcdir/keymux-niri.service" "$pkgdir/usr/lib/systemd/user/keymux-niri.service"
        fi
        if pacman -Qq hyprland &>/dev/null; then
            install -Dm644 "$srcdir/keymux-hyprland.service" "$pkgdir/usr/lib/systemd/user/keymux-hyprland.service"
        fi
        if pacman -Qq sway &>/dev/null; then
            install -Dm644 "$srcdir/keymux-sway.service" "$pkgdir/usr/lib/systemd/user/keymux-sway.service"
        fi
        if pacman -Qq i3-wm &>/dev/null; then
            install -Dm644 "$srcdir/keymux-i3.service" "$pkgdir/usr/lib/systemd/user/keymux-i3.service"
        fi
        if pacman -Qq bspwm &>/dev/null; then
            install -Dm644 "$srcdir/keymux-bspwm.service" "$pkgdir/usr/lib/systemd/user/keymux-bspwm.service"
        fi
    fi

    # Install OpenRC scripts (if OpenRC is detected)
    if [ -d "/etc/openrc" ] || [ -d "/etc/init.d" ]; then
        install -Dm755 "$srcdir/openrc-keymux" "$pkgdir/etc/init.d/keymux"

        if pacman -Qq niri &>/dev/null; then
            install -Dm755 "$srcdir/openrc-keymux-niri" "$pkgdir/etc/init.d/keymux-niri"
        fi
        if pacman -Qq hyprland &>/dev/null; then
            install -Dm755 "$srcdir/openrc-keymux-hyprland" "$pkgdir/etc/init.d/keymux-hyprland"
        fi
        if pacman -Qq sway &>/dev/null; then
            install -Dm755 "$srcdir/openrc-keymux-sway" "$pkgdir/etc/init.d/keymux-sway"
        fi
        if pacman -Qq i3-wm &>/dev/null; then
            install -Dm755 "$srcdir/openrc-keymux-i3" "$pkgdir/etc/init.d/keymux-i3"
        fi
        if pacman -Qq bspwm &>/dev/null; then
            install -Dm755 "$srcdir/openrc-keymux-bspwm" "$pkgdir/etc/init.d/keymux-bspwm"
        fi
    fi

    # Install runit service directories (if runit is detected)
    if [ -d "/etc/runit" ] || [ -d "/service" ]; then
        mkdir -p "$pkgdir/etc/sv/keymux/log"
        install -Dm755 "$srcdir/runit-keymux-run" "$pkgdir/etc/sv/keymux/run"
        install -Dm755 "$srcdir/runit-keymux-log-run" "$pkgdir/etc/sv/keymux/log/run"

        if pacman -Qq niri &>/dev/null; then
            mkdir -p "$pkgdir/etc/sv/keymux-niri/log"
            install -Dm755 "$srcdir/runit-keymux-niri-run" "$pkgdir/etc/sv/keymux-niri/run"
            install -Dm755 "$srcdir/runit-keymux-niri-log-run" "$pkgdir/etc/sv/keymux-niri/log/run"
        fi
        if pacman -Qq hyprland &>/dev/null; then
            mkdir -p "$pkgdir/etc/sv/keymux-hyprland/log"
            install -Dm755 "$srcdir/runit-keymux-hyprland-run" "$pkgdir/etc/sv/keymux-hyprland/run"
            install -Dm755 "$srcdir/runit-keymux-hyprland-log-run" "$pkgdir/etc/sv/keymux-hyprland/log/run"
        fi
        if pacman -Qq sway &>/dev/null; then
            mkdir -p "$pkgdir/etc/sv/keymux-sway/log"
            install -Dm755 "$srcdir/runit-keymux-sway-run" "$pkgdir/etc/sv/keymux-sway/run"
            install -Dm755 "$srcdir/runit-keymux-sway-log-run" "$pkgdir/etc/sv/keymux-sway/log/run"
        fi
        if pacman -Qq i3-wm &>/dev/null; then
            mkdir -p "$pkgdir/etc/sv/keymux-i3/log"
            install -Dm755 "$srcdir/runit-keymux-i3-run" "$pkgdir/etc/sv/keymux-i3/run"
            install -Dm755 "$srcdir/runit-keymux-i3-log-run" "$pkgdir/etc/sv/keymux-i3/log/run"
        fi
        if pacman -Qq bspwm &>/dev/null; then
            mkdir -p "$pkgdir/etc/sv/keymux-bspwm/log"
            install -Dm755 "$srcdir/runit-keymux-bspwm-run" "$pkgdir/etc/sv/keymux-bspwm/run"
            install -Dm755 "$srcdir/runit-keymux-bspwm-log-run" "$pkgdir/etc/sv/keymux-bspwm/log/run"
        fi
    fi

    install -Dm644 "$srcdir/config.example.ron" "$pkgdir/usr/share/doc/keymux/config.example.ron"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/keymux/README.md"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"
    "$srcdir/keymux" completion bash > "$pkgdir/usr/share/bash-completion/completions/keymux"
    "$srcdir/keymux" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_keymux"
    "$srcdir/keymux" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/keymux.fish"
    install -dm755 "$pkgdir/etc/skel/.config/keymux"
}
