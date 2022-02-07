# Notes on Homebrew

## What is Homebrew?

A [package manager](https://en.wikipedia.org/wiki/Package_manager) for macOS. If you're familiar with linux, it's similar to using `apt` or `yum` to install packages. Essentially, it's an easy way to install tools and code libraries through the command line.

## Understanding the beer analogy

Ok, I've worked with a package manager before, but what are all these weird terms like "formula", "keg", "rack", "tap"? It'll make much more sense to you if you understand beer culture. Here's a *brief* introduction:

![Beer Overview](homebrew-1.png)

- When you brew your beer you'll start with a recipe (a.k.a. [**formula**](https://en.wikipedia.org/wiki/Beer#Ingredients)).
- Once you've brewed your beer (according to the formula) you can put it into a [**keg**](https://en.wikipedia.org/wiki/Keg).
- You can store all these kegs on a [**rack**](https://assets.katomcdn.com/q_auto,f_auto/products/098/098-31842TT7/098-31842tt7.jpg).
- You can keep those racks in a [**cellar**](https://hamillmachine.ca/wp-content/uploads/2017/07/modular-keg-racks.jpg).

## Tying it back to package managers

Homebrew's creator @mxcl apparently loved beer culture. So much so that he built a beer-themed package manager.

![Homebrew Overview](homebrew-2.png)

## Creating your own formula!

Setup:

```bash
# Install Homebrew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
==> This script will install:
/usr/local/bin/brew
/usr/local/share/doc/homebrew
/usr/local/share/man/man1/brew.1
/usr/local/share/zsh/site-functions/_brew
/usr/local/etc/bash_completion.d/brew
/usr/local/Homebrew
==> The following new directories will be created:
/usr/local/sbin
==> The Xcode Command Line Tools will be installed.

# Uninstall Homebrew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```

## References

- <https://brew.sh/>

<!-- 
TODO:
- Other ideas (1) tap, (2) cask / caskroom
- `ls -la /usr/local/bin`
- create our own package?
  - `brew edit`
  - `brew create URL` && `brew install <formula>`
-->
