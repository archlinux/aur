# rofi-gh

Allows you to get GitHub in [rofi](//github.com/davatorium/rofi).

  - List issues in your repositories and open them (`rofi-gh-issues`)
  - Looking for something else? Issues & PRs welcome :)

## Usage

Ensure the scripts you wish to use are somewhere on your `$PATH` (for example, `/usr/local/bin/rofi-gh-issues`) and run `rofi -show '<prompt>:<script>'` (`rofi -show 'GH:rofi-gh-issues'`).

### rofi-gh-issues

This one was my initial motivation for `rofi-gh`, so that I could sit down in the mood to work on something, but with nothing particular in mind, and see what issues I have open in my repositories. For that reason, the default (and presently only) query is:

  - [`user:@me is:open`](//github.com/issues?q=user%3A%40me+is%3Aopen) (default)

But I'm certainly open to adding configuration if you have other use-cases/desires (open an issue or PR).
