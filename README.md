# abra-aur

This is the aur install repo.

## How to publish to AUR

### Step 0 - Setup: Done once

- Create new ssh key and ssh config for the aur as described in the [arch wiki](https://wiki.archlinux.org/title/AUR_submission_guidelines#Authentication)
- Make account at <https://aur.archlinux.org> and add the ssh public key for the aur
- Ask Roxie to add your account as a maintainer
- Make sure you are listed as a maintainer in the top comments of the `PKGBUILD` file.
- This repo should have two remotes, this remote and `ssh://aur@aur.archlinux.org/abra-git.git`.

### Step 1 - Changes and testing

- Make required changes to `PKGBUILD`. In this repo, we are just running the git repo so there is no reason to version bump. If you run `makepkg` it will edit `PKGBUILD` for you and bump it. If this is all you are doing and need to commit that bump, continue to step 2.
- Use Arch based system (VM if you don't have one at home) with the base-devel package.
- run `makepkg -i` to build the package and install it to the system
- test it works as intended

### Step 2 - Pushing the changes

- run `makepkg --printsrcinfo > .SRCINFO`
- commit changes to the git repo
- Push commit to origin
- Push commit to aur with `git push aur main:master` (This will push the main branch to master, read more [here](https://bbs.archlinux.org/viewtopic.php?id=257186). it even has the quote "And, I resist attempts to pare down language.  1984 was meant as a warning, not a guide." if you wanna yikes today at some shitty tech bros)
- If all has gone well, this will push your changes to the aur and they will be accessable using an aur helper like `yay`
