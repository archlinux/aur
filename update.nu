#!/usr/bin/env nu

def check-pkgbuild [] {
    if not ("PKGBUILD" | path exists) {
        error make { msg: "PKGBUILD not found — run this script from the package directory." }
    }
}

def source-files [] {
    if not (".SRCINFO" | path exists) { return [] }
    open .SRCINFO --raw
    | lines
    | where { |l| ($l | str trim) =~ '^source = ' }
    | each { |l| $l | str trim | str replace 'source = ' '' | split row '::' | first }
}

def do-clean [] {
    for f in (source-files) {
        if ($f | path exists) { rm $f }
    }
    if ("src" | path exists) { rm -rf src }
    if ("pkg" | path exists) { rm -rf pkg }
    print "Cleaned source files and build directories."
}

def do-verify [install: bool] {
    do-clean

    print "\nRunning makepkg --verifysource..."
    ^makepkg --verifysource
    if $env.LAST_EXIT_CODE != 0 {
        error make { msg: "Checksum verification failed." }
    }

    let flags = if $install { "-sif" } else { "-sf" }
    print $"\nRunning makepkg ($flags) --cleanbuild..."
    ^makepkg $flags --cleanbuild
    if $env.LAST_EXIT_CODE != 0 {
        error make { msg: "Build failed." }
    }
}

# Remove downloaded sources and build directories
def "main clean" [] {
    check-pkgbuild
    do-clean
}

# Re-download sources, verify checksums, and build. Pass --install to also install the built package.
def "main verify" [--install] {
    check-pkgbuild
    do-verify $install
}

# Fetch the latest GitHub release and update the PKGBUILD
def "main bump" [] {
    check-pkgbuild

    let pkgbuild_path = "PKGBUILD"
    let content = open $pkgbuild_path --raw

    # Parse current pkgver
    let current_ver = (
        $content
        | parse --regex 'pkgver=(?<ver>[^\s]+)'
        | get ver.0
    )
    print $"Current version: ($current_ver)"

    # Fetch latest release from GitHub
    print "Checking GitHub for latest release..."
    let release = (
        http get
            --headers { "User-Agent": "nushell-pkgbuild-updater" }
            "https://api.github.com/repos/peters/horizon/releases/latest"
    )
    let latest_tag = $release.tag_name
    let latest_ver = ($latest_tag | str replace --regex '^v' '')
    print $"Latest version:  ($latest_ver)"

    if $latest_ver == $current_ver {
        print "Package is already up to date."
        return
    }

    print $"New version available: ($current_ver) → ($latest_ver)"

    # Download tarball and compute its sha256
    let tar_url = $"https://github.com/peters/horizon/releases/download/($latest_tag)/horizon-linux-x64.tar.gz"
    let tmp_tar = "/tmp/horizon-update-check.tar.gz"

    print $"Downloading ($tar_url)..."
    ^curl -fsSL -o $tmp_tar $tar_url
    if $env.LAST_EXIT_CODE != 0 {
        error make { msg: "Failed to download tarball." }
    }

    let new_sha = (^sha256sum $tmp_tar | split row " " | first | str trim)
    print $"New checksum:    ($new_sha)"

    # Extract the current first sha256 entry (corresponds to horizon-linux-x64.tar.gz)
    let lines = ($content | lines)
    let sha_block_idx = (
        $lines
        | enumerate
        | where { |it| ($it.item | str trim) =~ '^sha256sums=\(' }
        | get 0.index
    )
    let old_sha = ($lines | get ($sha_block_idx + 1) | str trim | str replace --all "'" "")
    print $"Old checksum:    ($old_sha)"

    # Patch PKGBUILD: update pkgver, reset pkgrel, replace tarball checksum
    let updated = (
        $content
        | str replace --regex 'pkgver=[^\n\r]+' $"pkgver=($latest_ver)"
        | str replace --regex 'pkgrel=[^\n\r]+' "pkgrel=1"
        | str replace $"    '($old_sha)'" $"    '($new_sha)'"
    )
    $updated | save --force $pkgbuild_path
    print "PKGBUILD patched."

    # Update .SRCINFO now so source-files picks up the new version's entries
    print "Updating .SRCINFO..."
    ^makepkg --printsrcinfo | save --force .SRCINFO

    do-verify true

    # Ask whether to commit
    print ""
    let answer = (input $"Commit changes for v($latest_ver)? [y/N] " | str downcase | str trim)
    if $answer == "y" {
        ^git add PKGBUILD .SRCINFO
        ^git commit -m $"chore: bump horizon-terminal-bin to v($latest_ver)"
        print "Changes committed."
    } else {
        print "Skipped commit."
    }
}

def main [] {
    print "Usage: update.nu <command>"
}
