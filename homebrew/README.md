# 📦 Unnpacking Homebrew

## What is Homebrew?

A [package manager](https://en.wikipedia.org/wiki/Package_manager) for macOS. If you're familiar with linux, it's similar to using `apt` or `yum` to install packages. Essentially, it's an easy way to install tools and code libraries through the command line.

## Understanding the beer analogy

Ok, I've worked with a package manager before, but what are all these weird terms like "formula", "keg", "rack", "tap"? It'll make much more sense to you if you understand beer culture. Here's a *brief* and *oversimplified* introduction:

![Beer Overview](homebrew-1.png)

- When you brew your beer you'll start with a recipe (a.k.a. [**formula**](https://en.wikipedia.org/wiki/Beer#Ingredients)).
- Once you've brewed your beer (according to the formula) you can put it into a [**keg**](https://en.wikipedia.org/wiki/Keg).
- You can store all these kegs on a [**rack**](https://assets.katomcdn.com/q_auto,f_auto/products/098/098-31842TT7/098-31842tt7.jpg).
- You can keep those racks in a [**cellar**](https://hamillmachine.ca/wp-content/uploads/2017/07/modular-keg-racks.jpg).

## Tying it back to package managers

![Homebrew Overview](homebrew-2.png)

- All official Homebrew formulas are hosted in [this Github repository](https://github.com/Homebrew/homebrew-core). When you install a package, you're simply running one of these Ruby scripts.
- The default location a package is installed to is `/usr/local/Cellar`. The package's executable is then sym-linked into `/usr/local/bin`
- Additional Homebrew concepts (e.g. Casks, Taps) found [here](https://docs.brew.sh/Formula-Cookbook).

## Getting started with Homebrew

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

# Install a package
$ brew install jq

# Show jq executable sym-linked into Cellar
$ ls -l /usr/local/bin
lrwxr-xr-x  1 thomasnguyen  admin         jq -> ../Cellar/jq/1.6/bin/jq
```

A few interesting things to notice:

- everything Homebrew-related is installed under `/usr/local`
- all executables installed by Homebrew are under `/usr/local/Cellar` and `/usr/local/Caskroom`
- these executables are sym-linked into `/usr/local/bin` so that they can be immediately called from your command line.

## Creating our own formula

As we've now learned, `brew install` is simply Homebrew executing a formula (ruby script) which defines how to install the package.

Let's try writing our own formula!

1. Identify the `.tar.gz` executable you want to be able to install using `brew`. I've decided to create a formula for `wget` (<https://www.gnu.org/software/wget/>)

2. Use `brew create` to generate a ruby script

    ```bash
    brew create --set-name my-wget https://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz
    ```

3. Modify the Ruby script to include instructions on how to install

    ```ruby
    class MyWget < Formula
      homepage "https://www.gnu.org/software/wget/"
      url "https://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz"
      sha256 "52126be8cf1bddd7536886e74c053ad7d0ed2aa89b4b630f76785bac21695fcd"

      depends_on "gnutls"

      def install
        system "./configure", "--prefix=#{prefix}"
        system "make", "install"
      end
    end
    ```

4. Run `brew install` on the formula we just created. Notice all the dependencies that need to be installed for `my-wget` and `gnutls`

    ```bash
    brew install --build-from-source my-wget
    ```

5. Test and check. Notice that even though our formula is called `my-wget`, the executable we installed from gnu is still called `wget`.

    ```bash
    $ ls /usr/local/Cellar/my-wget/1.15/bin
    wget

    $ ls -l /usr/local/bin/wget
    lrwxr-xr-x  1 thomasnguyen  admin  /usr/local/bin/wget -> ../Cellar/my-wget/1.15/bin/wget

    $ wget google.com
    ```

## Other tidbits

- you can use `brew edit` to locally change an existing formula

## References

- <https://brew.sh/>
- <https://github.com/Homebrew>
- <https://docs.brew.sh/Formula-Cookbook>
- <https://rubydoc.brew.sh/Formula>

<!-- 
TODO:
- `rm /usr/local/etc/wgetrc`??
-->
