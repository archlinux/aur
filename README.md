# shadow

These are the package build sources for [shadow].
We provide distribution patches on top of it for multiple reasons:

- there is overlap in functionality with pam and util-linux but no proper build system support for fine-grained removing or disabling of functionality
- the chosen upstream defaults are either not safe or do not fit our distribution's purpose

The Arch Linux specific patches are developed/rebased/applied on top of releases of the [shadow] project in the [source repository] and are maintained by Arch Linux package maintainers.

## Package sources

The sources for this package are retrieved from two separate upstreams:

- the [shadow] project release
- the [source repository] release, which contains the distribution patches

---
Note: While retrieving upstream sources from a single location is in theory possible with `git` sources, we instead strive to provide signed distribution patches so that third-parties can authenticate them).

---

## Source repository

The function of the [source repository] is to

- develop and rebase distribution patches on top of newer releases of the [shadow] project
- create a unified location for the download of distribution of patches using forge releases

To enable this, the tags of the [shadow] repository and [source repository] must be fetched when working with the repository locally.
This package source repository contains tooling to help in maintaining the [source repository].

Make sure to install the [`just`] package and use the following to gain an overview of the available recipes:

```bash
just
```

### Releases

Releases are created for custom tags which contain the commits specific to the Arch Linux distribution.

Tags are of the form `X.Y.Z-archA`, where `X`, `Y` and `Z` represent the upstream major, minor and patch level version (respectively) and `A` represents the version of the Arch Linux specific patches applied/rebased on top of the upstream [shadow] version.

A forge release is accompanied by a (compressed) patch for the distribution changes, plus [detached OpenPGP signature].

### Setup source repository

Use the following to clone the [source repository] and set it up:

```bash
just setup-sources
```

---
Note: By default, the [source repository] is cloned in a pre-defined, per-user location, which can be overriden using the `source_dir` variable (see [setting variables from the command line] for further information).

---

### Fetch updates for sources

Use the following to fetch updates of the git remotes, which are setup for the [source repository]:

```bash
just fetch-sources
```

### Work with source repository

A dedicated [`just`] recipe allows for directly working on the local clone of the [source repository] using `git`:

```bash
just git
```

Alternatively, go to the directory, to work on the [source repository] directly:

```bash
cd "$(just get-source-dir)"
```

### Configure source repository

In case your default git configuration does not contain the correct user configuration, you will need to set it up once accordingly!

```bash
just git config --local user.name "John Doe"
just git config --local user.email "john@example.org"
just git config --local signingKey "f1d2d2f924e986ac86fdf7b36c94bcdf32beec15"
```

## Package maintainer information

In case you want to co-maintain this package, please make sure to request to be added as developer to the [source repository] by opening a ticket about this in <https://gitlab.archlinux.org/archlinux/infrastructure/-/work_items>.

---
Note: The workflow for releasing new versions of this package is somewhat involved.
      We are developing/rebasing distribution-specific commits on top of each released version of the [shadow] project.

---

### Rebase distribution patches on top of new version of the shadow project

To checkout the distribution patches of an earlier [shadow] release and rebase them on top of a newer [shadow] release, use the following:

```bash
just git checkout X.Y.1-archA
just git rebase -S -i X.Y.2
```

### Creating a release

Releases for the [source repository] can be created, once distribution patches have been applied and a tag has been created.

```bash
just release
```

This will automatically create a new tag (e.g. `X.Y.Z-arch1`) in the [source repository] and create a forge release, that contains the distribution patches (compressed and signed) on top of the [shadow] version `X.Y.Z`.

The prerelease is `arch1` by default but can be adjusted using the `prerelease` parameter to the just recipe, e.g.:

```bash
just release arch2
```

[`just`]: https://archlinux.org/packages/extra/x86_64/just/
[detached OpenPGP signature]: https://openpgp.dev/book/signing_data.html#detached-signatures
[setting variables from the command line]: https://just.systems/man/en/setting-variables-from-the-command-line.html
[shadow]: https://github.com/shadow-maint/shadow
[source repository]: https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow
