Mac bash scripts
================

### A repository of (*potentially*) useful OSX & MacOS bash scripts.

_______________________________________________

## **bootstrap_osx.sh** - *Quicksetup script that installs homebrew w/cask, vim8.x, python3 with pipenv, npm, and some minor OS configs.*
This is intended for Mac OS X 10.9 and above, but, it should still work for versions 10.8 and below assuming you know how to handle installing gcc instead.

*- - - Feel free to modify the script to your liking to include or remove components/packages to fit your needs.*

**NOTE**: *Before running, **make sure you install the  Xcode suite OR the command line tools first!** This should be the only thing you need to do on a fresh Mac or OSX image before cloning/running this script.*

**0**. *If you need the full Xcode suite, install that first from the Mac App Store.* Otherwise, just **install the command line tools**:

- For OSX 10.9 and newer: simply run `xcode-select --install` from the terminal to install the required command line tools.
- (*Not recommended*) For OSX 10.8 and older: Install gcc with homebrew by using the apple-gcc42 package from homebrew/dupes

**1**. In your terminal app, and download this repo:

~~~
git clone https://github.com/aj83854/macos-bashfiles.git
~~~

**2**. Rename (`mv`) & `cd` into a folder of your choice (in this example, `bin`):

~~~
mv ~/macos-bashfiles ~/bin && cd bin
~~~

**3**. Provide the script the appropriate permissions:

~~~
chmod u+x bootstrap_osx.sh
~~~

**4**. Add to PATH in your *.bash_profile* or *.bashrc file*:
~~~
# EXAMPLE STEPS:
# cd ~
# vim .bash_profile (or whatever text editor you prefer)

...

# Path to put in .bash_profile (or .bashrc) for shell scripts.
# Replace <YOUR_USER_NAME> with the name of your user account (essentially it's $HOME/bin)
PATH="/Users/<YOUR_USER_NAME>/bin:${PATH}"
export PATH
~~~

**5**. Execute script:
~~~
bootstrap_osx.sh
~~~

The script will first ask you if you've completed step 0 and if you're ready to continue. \
Enter `y` to run the script. Then, sit back and watch as your familiar Mac environment is quickly downloaded, installed and setup for you. **Easy!**
_______________________________________________
_______________________________________________
