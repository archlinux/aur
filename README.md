# lucidglyph Arch packages

This split `PKGBUILD` builds two separately installable packages:

- `lucidglyph` packages the rendering adjustments from [upstream lucidglyph](https://github.com/maximilionus/lucidglyph).
- `fontconfig-curated-defaults` supplies an independent, opinionated Fontconfig profile for generic font families. It is unaffiliated with upstream lucidglyph and works without `lucidglyph` installed.

`lucidglyph` lists the companion as an optional dependency. Its binary package retains its existing runtime dependencies; installing it leaves the profile optional. Both packages share the recipe's version and release numbers.

## Curated defaults

| Generic family requests | Preferred family |
| --- | --- |
| `sans-serif`, `sans`, `sans serif` | Roboto |
| `system-ui`, `system ui`, `ui-sans-serif` | Roboto |
| `monospace`, `mono`, `ui-monospace` | Cascadia Mono |

The companion depends on `fontconfig`, `ttf-roboto`, and `ttf-cascadia-code`, which supplies Cascadia Mono. It leaves `serif`, `ui-serif`, `cursive`, `fantasy`, `ui-rounded`, `emoji`, `math`, and `fangsong` to the existing Fontconfig configuration. Fallback can still change when a specialist font is unavailable or lacks the requested glyphs.

The profile applies system-wide and changes generic font preferences, including the distribution's generic UI default. Applications or desktop settings that explicitly select a font retain that choice. Weak aliases preserve Fontconfig's fallback lists; administrator and user Fontconfig rules can further customize preferences. UI matches also depend on cached generic-family classifications.

The package enables `/usr/share/fontconfig/conf.avail/59-curated-defaults.conf` through a package-owned link in `/etc/fonts/conf.d`. Removing the companion removes that profile. Installation, upgrade, and removal force a system font-cache refresh so generic-family classifications follow the active configuration. Restart running applications to pick up changes.

## Building

Run `makepkg` to build both packages. Packaging the configuration files does not require the font packages; they are runtime requirements of the companion. To sign both binary packages with the configured key:

```sh
makepkg --sign --key 265281061734E45F2BF0489803E9CD3D5C5D378E
```

Install only the rendering adjustments:

```sh
sudo pacman -U ./lucidglyph-0.16.0-2-any.pkg.tar.zst
```

Install the curated family preferences and their required fonts:

```sh
sudo pacman -U ./fontconfig-curated-defaults-0.16.0-2-any.pkg.tar.zst
```

These packages can be selected separately. The companion's required font packages are installed automatically when needed. `makepkg -si` installs both packages from this split recipe; use the explicit commands above when selecting only one.

`validpgpkeys` records the requested fingerprint; the upstream source ZIP has no detached signature and is verified using its SHA-512 checksum. Binary package signatures are separate from upstream source verification.
