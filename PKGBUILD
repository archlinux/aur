# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Meta package for all TTF Nerd Fonts from the official Arch repositories

pkgname=ttf-nerd-fonts-meta
pkgver=3.4.0
pkgrel=1
pkgdesc="Meta package for all TTF Nerd Fonts from the official Arch repositories"
arch=('any')
url="https://www.nerdfonts.com/"
license=('MIT' 'OFL-1.1' 'Apache-2.0')
depends=(
    # Nerd Font Symbols (required for icon support)
    'ttf-nerd-fonts-symbols'
    'ttf-nerd-fonts-symbols-mono'

    # All TTF Nerd Fonts from official repos (alphabetical)
    'ttf-0xproto-nerd'
    'ttf-3270-nerd'
    'ttf-agave-nerd'
    'ttf-anonymouspro-nerd'
    'ttf-arimo-nerd'
    'ttf-bigblueterminal-nerd'
    'ttf-bitstream-vera-mono-nerd'
    'ttf-cascadia-code-nerd'
    'ttf-cascadia-mono-nerd'
    'ttf-cousine-nerd'
    'ttf-d2coding-nerd'
    'ttf-daddytime-mono-nerd'
    'ttf-dejavu-nerd'
    'ttf-envycoder-nerd'
    'ttf-fantasque-nerd'
    'ttf-firacode-nerd'
    'ttf-go-nerd'
    'ttf-gohu-nerd'
    'ttf-hack-nerd'
    'ttf-heavydata-nerd'
    'ttf-iawriter-nerd'
    'ttf-ibmplex-mono-nerd'
    'ttf-inconsolata-go-nerd'
    'ttf-inconsolata-lgc-nerd'
    'ttf-inconsolata-nerd'
    'ttf-intone-nerd'
    'ttf-iosevka-nerd'
    'ttf-iosevkaterm-nerd'
    'ttf-iosevkatermslab-nerd'
    'ttf-jetbrains-mono-nerd'
    'ttf-lekton-nerd'
    'ttf-liberation-mono-nerd'
    'ttf-lilex-nerd'
    'ttf-martian-mono-nerd'
    'ttf-meslo-nerd'
    'ttf-monofur-nerd'
    'ttf-monoid-nerd'
    'ttf-mononoki-nerd'
    'ttf-mplus-nerd'
    'ttf-noto-nerd'
    'ttf-profont-nerd'
    'ttf-proggyclean-nerd'
    'ttf-recursive-nerd'
    'ttf-roboto-mono-nerd'
    'ttf-sharetech-mono-nerd'
    'ttf-sourcecodepro-nerd'
    'ttf-space-mono-nerd'
    'ttf-terminus-nerd'
    'ttf-tinos-nerd'
    'ttf-ubuntu-mono-nerd'
    'ttf-ubuntu-nerd'
    'ttf-victor-mono-nerd'
    'ttf-zed-mono-nerd'
)
optdepends=(
    # OTF variants from official repos (for users who prefer OpenType)
    'otf-aurulent-nerd: Aurulent Sans Mono (OTF variant)'
    'otf-codenewroman-nerd: Code New Roman (OTF variant)'
    'otf-comicshanns-nerd: Comic Sans/Comic Shanns (OTF variant)'
    'otf-commit-mono-nerd: Commit Mono (OTF variant)'
    'otf-droid-nerd: Droid Sans Mono (OTF variant)'
    'otf-firamono-nerd: Fira Mono (OTF variant)'
    'otf-geist-mono-nerd: Geist Mono (OTF variant)'
    'otf-hasklig-nerd: Hasklig/Hasklug (OTF variant)'
    'otf-hermit-nerd: Hermit (OTF variant)'
    'otf-monaspace-nerd: Monaspace/Monaspice (OTF variant)'
    'otf-opendyslexic-nerd: OpenDyslexic (OTF variant)'
    'otf-overpass-nerd: Overpass (OTF variant)'

    # AUR packages that provide additional nerd fonts not in official repos
    'nerd-fonts-sf-mono: SF Mono patched with Nerd Fonts (AUR)'
    'nerd-fonts-inter: Inter patched with Nerd Fonts (AUR)'
    'ttf-sarasa-gothic-nerd-fonts: Sarasa Gothic with Nerd Fonts (AUR)'
)
provides=('nerd-fonts-complete' 'ttf-nerd-fonts-complete')
# Conflicts with the AUR nerd-fonts-git package which bundles everything
# Users should choose one or the other
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')

# This is a meta package - no sources needed
source=()
sha256sums=()

package() {
    # Meta package - nothing to install
    # All fonts are pulled in via dependencies from official repos
    :
}
