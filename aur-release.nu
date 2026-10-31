#!/usr/bin/env nu
# AUR maintenance and publishing script for fprintd-clients-git-elogind

# Display help and available subcommands
def main [] {
    help main
}

# Clean build artifacts and temporary directories
def "main clean" [] {
    print "🧹 Cleaning temporary build artifacts..."
    let to_remove = [
        "src"
        "pkg"
        "fprintd"
        "PKGBUILD-namcap.log"
    ]
    for item in $to_remove {
        if ($item | path exists) {
            print $"  Removing ($item)..."
            # Ensure write permissions before deleting
            try { ^chmod -R u+rwX $item }
            rm -rf $item
        }
    }
    # Remove built package files
    let pkgs = (ls | where name =~ '\.pkg\.tar\.(zst|xz|gz)$' | get name)
    for pkg in $pkgs {
        print $"  Removing ($pkg)..."
        rm -f $pkg
    }
    print "✨ Clean complete."
}

# Regenerate .SRCINFO metadata file from PKGBUILD
def "main srcinfo" [] {
    print "📝 Regenerating .SRCINFO..."
    makepkg --printsrcinfo | save -f .SRCINFO
    print "✅ .SRCINFO successfully updated."
}

# Build package locally using makepkg
def "main build" [
    --clean (-c)    # Clean src/ and pkg/ before building
    --no-deps (-d)  # Skip dependency checks (pass -d to makepkg)
    --install (-i)  # Install built package with pacman (pass -i to makepkg)
    --force (-f)    # Force rebuild (pass -f to makepkg)
] {
    if $clean {
        main clean
    }

    mut args = ["-C"] # Cleans out work tree after build
    if $force {
        $args = ($args | append "-f")
    }
    if $no_deps {
        $args = ($args | append "-d")
    }
    if $install {
        $args = ($args | append "-i")
    }

    print $"🔨 Running makepkg ($args | str join ' ')..."
    ^makepkg ...$args
    print "✅ Build finished."
}

# Run quality checks with namcap if installed
def "main check" [] {
    print "🔍 Checking package..."
    if (which namcap | is-empty) {
        print "⚠️  'namcap' is not installed. You can install it with: sudo pacman -S namcap"
        print "ℹ️  Performing basic checks..."
    } else {
        print "📋 Running namcap on PKGBUILD..."
        ^namcap PKGBUILD

        let built_pkgs = (ls | where name =~ '\.pkg\.tar\.(zst|xz|gz)$' | get name)
        for pkg in $built_pkgs {
            print $"📋 Running namcap on ($pkg)..."
            ^namcap $pkg
        }
    }

    # Verify sha256sums
    print "🔐 Verifying integrity sums with updpkgsums / makepkg -g..."
    ^makepkg -g
    print "✅ Check completed."
}

# Bump pinned git commit hash and update pkgver + .SRCINFO
def "main bump-commit" [
    commit_hash: string # New full commit hash to pin
] {
    print $"🔄 Updating _commit to ($commit_hash) in PKGBUILD..."
    let content = (open PKGBUILD)
    let updated = ($content | str replace -r '_commit=[0-9a-fA-F]+' $"_commit=($commit_hash)")
    $updated | save -f PKGBUILD

    print "📦 Updating pkgver from VCS checkout..."
    ^makepkg -od

    print "📝 Updating .SRCINFO..."
    main srcinfo

    print $"✅ Commit bumped to ($commit_hash)."
}

# Stage, commit, and push package updates to AUR
def "main publish" [
    --message (-m): string # Commit message (defaults to automated bump message)
    --dry-run              # Show staged files without committing or pushing
] {
    print "🚀 Preparing AUR release..."

    # Ensure .SRCINFO is updated
    main srcinfo

    let tracked_files = [
        "PKGBUILD"
        ".SRCINFO"
        "0001-disable-systemd-reactivated.diff"
        "0002-Remove-ignored-positional-arguments.patch"
        "0003-support-elogind.patch"
        ".gitignore"
        "aur-release.nu"
    ]

    for file in $tracked_files {
        if ($file | path exists) {
            git add $file
        }
    }

    let status = (git status --porcelain)
    if ($status | str trim | is-empty) {
        print "⚠️  No changes staged to commit."
        return
    }

    print "📦 Staged changes:"
    ^git status -s

    if $dry_run {
        print "🔎 [Dry-run] Not committing or pushing."
        return
    }

    let pkgver_current = (open PKGBUILD | lines | find 'pkgver=' | first | str replace 'pkgver=' '' | str trim)
    let pkgrel_current = (open PKGBUILD | lines | find 'pkgrel=' | first | str replace 'pkgrel=' '' | str trim)
    let default_msg = $"chore: update fprintd-clients-git-elogind to ($pkgver_current)-($pkgrel_current)"

    let commit_msg = if ($message | is-empty) { $default_msg } else { $message }

    print $"💬 Committing with message: '($commit_msg)'..."
    ^git commit -m $commit_msg

    print "🚀 Pushing to AUR origin master..."
    ^git push origin master

    print "🎉 Published to AUR successfully!"
}
