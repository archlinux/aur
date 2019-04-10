# git pair

Generates an executable file named `gitpair`

## Future features

1. Create alias for `git pair`

# Commands

## gitpair

0. If file doesn't exist and `gitpair` is ran, display error and suggest `gitpair init`
1. Prompt to select author
2. Prompt to select Co-author
3. Change author via `git config user.name` and `git config user.email`
4. Create/edit commit template in $PWD/.git/config by adding `\n\nCo-authored-by: First Last <email>`
5. Check if `git config commit.template` equals `.git/commit-template`
6. If not, execute `git config commit.template .git/commit-template`

## gitpair init

1. Create `.gitauthors` in `$PWD` if it does not exist.
2. Invoke `gitpair add`
3. Invoke `gitpair` to set up the author and optional co-author

## gitpair add

0. If file `.gitauthors` doesn't exist and `gitpair add` is ran, display error and suggest `gitpair init`
1. Prompt for developer info (full name, email)
2. Loop developer entry prompt, exit with `q` or `-`