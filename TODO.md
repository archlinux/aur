# git pair

1. Create pre-commit hook which changes the author
2. Create/edit commit template in $PWD/.git/config
3. Check if `git config commit.template` equals `.git/commit-template`
4. If not, execute `git config commit.template .git/commit-template`

# Commands

## git pair

0. If file doesn't exist and `git pair` is ran, display error and suggest `git pair init`
1. Prompt to select author
2. Prompt to select Co-author

## git pair init

0. If file exists, display an error message and exit
1. Prompt for developer info (first, last, email)
2. Generate file after first dev is added
3. loop developer entry prompt, exit with `q`
4. Display success message

## git pair add

0. If file doesn't exist and `git pair add` is ran, display error and suggest `git pair init`