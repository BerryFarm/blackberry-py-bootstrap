# Blackberry-Py bootstrap

This repository allows you to quickly bootstrap a [Blackberry-Py](http://blackberry-py.microcode.ca/) application and start writing BB10 apps with Python.

## Get it running

1. Clone this repository with the submodule(s)
  ```
  git clone --recurse-submodules https://github.com/BerryTrucks/blackberry-py-bootstrap
  ```
2. Install Python 3.2.2. The easiest way is through [pyenv](https://realpython.com/intro-to-pyenv/#installing-pyenv)
3. Generate a debug token (see how below)
4. Run `make` to compile a bar file, or
5. Enable Developer mode on your BB10 device, adjust `signing/bbpass` with your real IP address and run
  ```
  make deploy
  ```

## Generating a debug token

* Use this form to obtain your `bbidtoken.csk` file: https://developer.blackberry.com/codesigning/
* Copy `bbidtoken.csk` to `signing/bbidtoken.csk`
* In `signing/bbpass`, fill in:
  - `CNNAME`: the Common Name for your signing cert (usually your name)
  - `KEYSTOREPASS`: CSK password you entered in step 1 signup
  - `BBPIN`: target device's PIN
  - `BBPASS`: target device's password
* Run `make` in `signing/Makefile` to request and deploy the token to your device.

Important: any symbols need to be escaped according to bash / Makefile rules e.g. backslashes before symbols `\!` and double dollar signs `\$$`.

## See also

* https://github.com/krruzic/Reader-YC - full HackerNews reader app built with Blackberry Py
* The official Blackberry-Py repo with code samples - https://bitbucket.org/microcode/blackberry-py/src/default/

## Thanks

* [Peter Hansen](http://peterhansen.ca/) for Blackberry-Py
* [Xitij Ritesh Patel](http://www.xitijpatel.com/) for Blackberry-Py-bootstrap
* [Term48](https://github.com/mordak/Term48) contributors for scripting the debug token generation
