# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=moonray-git
_pkgname=openmoonray
pkgver=1.0.0.0
pkgrel=1
pkgdesc='DreamWorks’ production MCRT renderer'
arch=(x86_64)
license=(Apache2)
url="https://$_pkgname.org"
_url="https://github.com/dreamworksanimation"
depends=()
makedepends=(cmake)
source=("$_pkgname::git+$_url/$_pkgname#tag=v$pkgver"
        "$_pkgname+arras+arras4_core::git+$_url/arras4_core.git"
        "$_pkgname+arras+arras_render::git+$_url/arras_render.git"
        "$_pkgname+arras+distributed+arras4_node::git+$_url/arras4_node.git"
        "$_pkgname+arras+distributed+minicoord::git+$_url/minicoord.git"
        "$_pkgname+cmake_modules::git+$_url/cmake_modules.git"
        "$_pkgname+moonray+hydra+hdMoonray::git+$_url/hdMoonray.git"
        "$_pkgname+moonray+hydra+moonray_sdr_plugins::git+$_url/moonray_sdr_plugins.git"
        "$_pkgname+moonray+mcrt_denoise::git+$_url/mcrt_denoise.git"
        "$_pkgname+moonray+moonray::git+$_url/moonray.git"
        "$_pkgname+moonray+moonray_arras+mcrt_computation::git+$_url/mcrt_computation.git"
        "$_pkgname+moonray+moonray_arras+mcrt_dataio::git+$_url/mcrt_dataio.git"
        "$_pkgname+moonray+moonray_arras+mcrt_messages::git+$_url/mcrt_messages.git"
        "$_pkgname+moonray+moonray_dcc_plugins::git+$_url/moonray_dcc_plugins.git"
        "$_pkgname+moonray+moonray_gui::git+$_url/moonray_gui.git"
        "$_pkgname+moonray+moonshine::git+$_url/moonshine.git"
        "$_pkgname+moonray+moonshine_usd::git+$_url/moonshine_usd.git"
        "$_pkgname+moonray+render_profile_viewer::git+$_url/render_profile_viewer.git"
        "$_pkgname+moonray+scene_rdl2::git+$_url/scene_rdl2.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# git submodule status | cut -c2- | awk '{s=$2; gsub("/", "+", s); gsub(".*/", "", $2); print "\"$_pkgname+" s "::git+$_url/" $2 ".git\"" }'

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
}

package() {
	cd "$_pkgname"
}
