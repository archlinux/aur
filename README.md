# Overview

This is the Archlinux source package (in the sense of the PKGBUILD file) for
‘ghc-cabal-arts’, a package that provides a standard GHC and cabal-install
setup but with dynamic and static files, so that users can build additional
packages without having to also update the default configuration to build
dynamically only; but also that includes the ‘fix-dynamic-deps’ patchset (cabal
pull-request ID 8461), to further enhance the build by tracking static vs.
dynamic build artifacts in ghc-pkg InstalledPackageInfo's (requires a patched
ghc-pkg too for this function to be enabled, from ghc.git) and managing these
fields when figuring out dependencies.

The patchset can be found here: <https://github.com/haskell/cabal/pull/8461>.

This package is intended to fix errors of the sort:

```
[1 of 1] Compiling Main             ( Main.hs, ../setup.dist/work/depender/dist/build/depender/depender-tmp/Main.o )

Main.hs:3:1: error:
    Could not find module `Dynamic'
    There are files missing in the `dynamic-1.0' package,
    try running 'ghc-pkg check'.
    Use -v (or `:set -v` in ghci) to see a list of the files searched for.
  |
  | import qualified Dynamic (number)
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

# Information

More information about the use of this package can be found in this revision to
the Haskell article on Archwiki, although it was reverted:
<https://wiki.archlinux.org/index.php?title=Haskell&diff=745459&oldid=738269>

Here is a copy of the markdown:

```
== Troubleshooting ==

=== Static files: There are files missing in the `dynamic-1.0' package, ===

If when building a package from a default ‘ghc’ and ‘cabal-install’ setup, you encounter an error like this:

{{bc|
[1 of 1] Compiling Main             ( Main.hs, ../setup.dist/work/depender/dist/build/depender/depender-tmp/Main.o )

Main.hs:3:1: error:
    Could not find module `Dynamic'
    There are files missing in the `dynamic-1.0' package,
    try running 'ghc-pkg check'.
    Use -v (or `:set -v` in ghci) to see a list of the files searched for.
  {{!}}
  {{!}} import qualified Dynamic (number)
  {{!}} ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
}}

Then probably the system haskell packages are providing only dynamic build artifacts (.dyn_hi, .so), but your default cabal configuration is configured to build static files too (.hi, .a), but cabal-install doesn't know they're missing.

‘ghc’ and ‘cabal-install’ don't install static files, and extra ‘haskell-*’ packages like https://github.com/archlinux/svntogit-community/blob/master/haskell-scientific/trunk/PKGBUILD build with ‘--enable-shared --enable-executable-dynamic --disable-library-vanilla’ - these packages are installed in the packagedb located at e.g. /usr/lib/ghc-9.0.2/package.conf.db.  However the default ~/.cabal/config configuration (‘library-vanilla’, ‘shared’, ‘executable-dynamic’) enables both dynamic and static building.

I submitted a [https://github.com/haskell/cabal/pull/8461 merge request] to let cabal-install track static vs dynamic build artifacts in its dependencies and ghc-pkg InstalledPackageInfo's.  It may also be desirable for at least the base system haskell packages to provide all artifact types, at least as an option.

In the meantime, there are a number of workarounds or solutions:

==== Dynamic-only user config ====

One option is to simply disable all static file building by adding the
following to your cabal configuration in ~/.cabal/config:
{{bc|
library-vanilla: False
shared: True
executable-dynamic: True
}}

Then cabal-install and ghc would have no need for static files in its base packages or extra haskell-* system packages.

==== Using only stack ====

Another workaround is to use only stack.

==== Building local ghc and cabal-install ====

To build a full GHC that includes static files, you can bootstrap the build with only a system package provided the ghc implementation through the ‘ghc’ package, as part of the phase 0 bootstrapping Haskell compiler, before GHC again recompiles itself after stage 1 to build its final stage 2 compiler.

You can clone ghc (recursively clone submodules) and checkout the latest stable release, e.g.  ‘ghc-9.4.2-release’, and then run {{ic|./boot}}, e.g. {{ic|1=PATH=/usr/bin ./configure --prefix="${HOME}/local/ghc-9.4.2"}}, {{ic|make -j7}}, and {{ic|make install}}, and then update your PATH in e.g. .zshrc to include ~/local/ghc-9.4.2/bin.  (If you would like to customize the build settings for your build, you can override the defaults by copying in mk/ build.mk.sample to build.mk and editing as desired.)  Afterwards you should have ghc (and a few other programs like ghc-pkg).  Then you just need to bootstrap cabal-install.  (As this is an in-development version, you may need to update version requirements in dependencies for base and/or Cabal to include e.g. your GHC 9.4.2 (base 4.17) and Cabal 3.9 versions, or there may be build errors, for ghc or cabal-install.)

Afterwards, you would only need to then bootstrap cabal install.  Similarly clone cabal, and run e.g. {{ic|1=cabal v2-build --project-file=cabal.project.release cabal-install -v && cabal v2-build --project-file=cabal.project.validate cabal-testsuite:cabal-tests -v}} to get it built, and {{ic|1=cabal v2-install --project-file=cabal.project.release cabal-install -v}} to install cabal-install (optionally run {{ic|1=cabal v2-install --project-file=cabal.project.validate cabal-testsuite:cabal-tests --overwrite-policy=always}} to install the Cabal PackageTests test suite runner).

===== Building patched local ghc and cabal-install =====

If you want to include the patchset in [https://github.com/bairyn/cabal/commits/fix-dynamic-deps https://github.com/bairyn/cabal/commits/fix-dynamic-deps], you can perform a similar process as before.  These changes make cabal-install aware of whether installed packages provide static or dynamic files so that it prefers rebuilding from source if artifacts are missing, if the ghc-pkg is also likewise patched to be aware of new ghc-pkg InstalledPackageInfo fields.

Install ghc into e.g. ~/local/ghc-9.4.2-arts by recursively cloning ghc, checking out the latest stable release, changing the Cabal submodule to have the fix-dynamic-deps branch checked out (e.g. inside the submodule subdirectory, {{ic|git remote add bairyn https://github.com/bairyn/cabal}}, {{ic|git fetch --all}}, and {{ic|git checkout fix-dynamic-deps}}), updating version requirements (e.g. with new Cabal* ranges {{ic|1=>= 3.9 && < 3.10}} in utils/ghc-cabal/ghc-cabal.cabal, libraries/ghc-prim/ghc-prim.cabal, libraries/ghc-boot/ghc-boot.cabal.in, libraries/Cabal, compiler/ghc.cabal.in), and building as before.

Then install cabal-install similarly, with Cabal's {{ic|*/*.cabal}} dependencies updated so that base is updated (e.g. for ghc-9.4.2, ‘< 4.18’) and setup-depends Cabal* dependencies are updated for e.g. 3.9.* rather than 3.6.
```

# Notes

This package includes a patched cabal-install (track dynamic vs static build
artifacts and dependencies) and GHC (essentially just so that ghc-pkg
recognizes new fields in e.g.  `/usr/lib/ghc-9.4.2/package.conf.d/*.conf`, that
is, InstalledPackageInfo files).

There are a few related TODO notes in the cabal-install source, such as `
--TODO: [required feature]: also needs to be handled recursively` for
`elabVanillaLib` in `ProjectPlanning.hs`.

The InstalledPackageInfo record corresponds to these `*.conf` files and are
part of package DBs.  They track information about installed packages.

Without this patchset, these records lack information about what kinds of build
artifacts are present or missing in the installed package, in particular
dynamic and static files.

With this patchset, cabal-install and ghc have an extended InstalledPackageInfo
record with 5 new fields.  The other major component is that cabal-install's
dependency solver becomes aware of build artifact requirements between
packages, so that it knows when it should prefer building a package from source
rather than choosing a pre-installed package if it lacks required build
artifacts.  (It also fixes an issue with cabal-install where flags to adjust
dynamic vs static building were ignored, as a dependency fix.)

Finally, note also that if packagedbs from _unpatched_ Haskell installations
are being used with cabal-install, then these IPI fields in the `.conf` files
are missing, and in this case cabal will default to assume True for these
fields, that is, it will assume from unpatched packagedbs that all build
artifacts are present when unspecified.  If the packagedbs (e.g. `haskell-*`
packages) use a different GHC version (e.g. 9.0.2), then this shouldn't be an
issue since by default these packagedb dirs should probably be ignored.
Otherwise without isolating these package dbs, the original missing artifact
dependencies errors may crop up again, from the packagedbs generated by
an unpatched cabal-install and ghc-pkg.

## Fixed Haskell installation on Archlinux

One way to fix the problem that ‘ghc’ and ‘cabal-install’ on Archlinux as of
2022-09-17 being broken without further configuration has two pieces:
1) This patchset, so that cabal-install has better awareness of static and
dynamic files, and
2) An option of base system (with GHC and cabal-install) packages that provide
all types of build artifacts, in particular static and dynamic; this is not as
essential for additional Haskell packages beyond the base, foundational
packages that others can depend on.

This package provides both pieces in one package.

## Revisions

- r7: Second iteration, fix a typo.
- r6: Second iteration, minor updates (skip tests on windows, changelog, update
  docs, rebase onto upstream).
- r5: Second iteration, fixed remaining tests.
- r4: Second iteration, completed version, ready for MR.  (Combines both
  `fix-dynamic-deps-2-arts` and `fix-project-local-flags`.)
- r3: Intermediate revision for testing before the second iteration PRs.
- r2: The first iteration, before splitting this validation pass to another
  phase.
