# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=moonray
pkgname=($pkgbase moonray-gui)
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
        "$_pkgname+arras+arras4_core::git+$_url/arras4_core.git#commit=2157c5103156f652b0966f23e32b97597b7ff16f"
        "$_pkgname+arras+arras_render::git+$_url/arras_render.git#commit=729c4039a72e2dacb810c17fd529eaa0308435f6"
        "$_pkgname+arras+distributed+arras4_node::git+$_url/arras4_node.git#commit=b02183bcab92f52d3041c254922c24fe9fc39e54"
        "$_pkgname+arras+distributed+minicoord::git+$_url/minicoord.git#commit=b80aee65186dc36a81c1a682a471456014c6c5ec"
        "$_pkgname+cmake_modules::git+$_url/cmake_modules.git#commit=3ebea9665cadadf67a76387f21c0548dd82d1bac"
        "$_pkgname+moonray+hydra+hdMoonray::git+$_url/hdMoonray.git#commit=8fc04a550a80e819cc17f48dccced7a976ab1ee7"
        "$_pkgname+moonray+hydra+moonray_sdr_plugins::git+$_url/moonray_sdr_plugins.git#commit=01a274e5d14b0b8ba4a6d1b6cfaa5ca538e74938"
        "$_pkgname+moonray+mcrt_denoise::git+$_url/mcrt_denoise.git#commit=710ca0bf75552b2f81e4a79f5ab614173a4c468c"
        "$_pkgname+moonray+moonray::git+$_url/moonray.git#commit=ba155b14779586254212c6973421ac2e7fcb47e9"
        "$_pkgname+moonray+moonray_arras+mcrt_computation::git+$_url/mcrt_computation.git#commit=2e778a66ae685c7df11d61278f6f159cb9efab65"
        "$_pkgname+moonray+moonray_arras+mcrt_dataio::git+$_url/mcrt_dataio.git#commit=6c84f98dc6341d6d414228bc573c8d2b5d745240"
        "$_pkgname+moonray+moonray_arras+mcrt_messages::git+$_url/mcrt_messages.git#commit=3e050e36e3db25433d27d7da75e34c5715e302d6"
        "$_pkgname+moonray+moonray_dcc_plugins::git+$_url/moonray_dcc_plugins.git#commit=ce861215cf2c4fec77c8decdabd96755917ae742"
        "$_pkgname+moonray+moonray_gui::git+$_url/moonray_gui.git#commit=606b411880cecab5a38392ee46a2edad7e652a7f"
        "$_pkgname+moonray+moonshine::git+$_url/moonshine.git#commit=faa2940107c04676d4dd2537a8c60b62a2ec504b"
        "$_pkgname+moonray+moonshine_usd::git+$_url/moonshine_usd.git#commit=efe09ee4b75d678005061d121cf832fc3f2d9a9a"
        "$_pkgname+moonray+render_profile_viewer::git+$_url/render_profile_viewer.git#commit=44bb5d66aa5295cc1176823d04a12cc4cd009e76"
        "$_pkgname+moonray+scene_rdl2::git+$_url/scene_rdl2.git#commit=fb0c969026b1e5a3c16cc75ee3ec9ff7df85ad98")
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

# git submodule status | cut -c2- | awk '{s=$2; gsub("/", "+", s); gsub(".*/", "", $2); print "\"$_pkgname+" s "::git+$_url/" $2 ".git#commit=" $1 "\"" }'

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
}

package_moonray() {
	cd "$_pkgname"
}

package_moonray-gui() {
        depends+=($pkgbase)
	cd "$_pkgname"
}
