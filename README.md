# git-merge-changelog

GNU utility to automatically resolve conflicts in prepend-only files (like CHANGELOG).

## Usage

### git

 - Add to `.git/config` of the checkout (or to your `$HOME/.gitconfig`) the lines

       [merge "merge-changelog"]
           name = GNU-style ChangeLog merge driver
           driver = /usr/bin/$pkgname/git-merge-changelog %O %A %B

 - In every directory that contains a ChangeLog file, add a file `.gitattributes` with this line:

      ChangeLog    merge=merge-changelog

   (See "man 5 gitattributes" for more info.)


### bzr

 - Install the 'extmerge' bzr plug-in listed at <http://doc.bazaar.canonical.com/plugins/en/index.html> and <http://wiki.bazaar.canonical.com/BzrPlugins>

 - Add to your $HOME/.bazaar/bazaar.conf the line

       external_merge = git-merge-changelog %b %T %o

 - Then, to merge a conflict in a ChangeLog file, use

       $ bzr extmerge ChangeLog


### hg

 - Add to your $HOME/.hgrc the lines

       [merge-patterns]
       ChangeLog = git-merge-changelog

       [merge-tools]
       git-merge-changelog.executable = /usr/bin/git-merge-changelog
       git-merge-changelog.args = $base $local $other

   See <https://www.selenic.com/mercurial/hgrc.5.html> section merge-tools for reference.


## Upgrading AUR package

 1. Change version in the `PKGBUILD`

 2. Update `.SRCINFO` file:

    ```sh
    makepkg --printsrcinfo > .SRCINFO
    ```

 3. Build package

    ```sh
    makepkg
    ```

 4. Commit and push changes


## Links

  - [Automagically merging ChangeLog files with mercurial or git](https://gnu.wildebeest.org/blog/mjw/2012/03/16/automagically-merging-changelog-files-with-mercurial-or-git/)
