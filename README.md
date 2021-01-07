<p align="center">
  <a href="https://hblock.molinero.dev">
    <img src="./resources/logo/vectors/logo-a.svg" width="320" height="100">
  </a>
</p>

<p align="center">
  Improve your security and privacy by blocking ads, tracking and malware domains.
</p>

<p align="center">
  <a href="https://github.com/hectorm/hblock/releases">
    <img src="https://img.shields.io/github/v/tag/hectorm/hblock?label=version">
  </a>
  <a href="https://hblock.molinero.dev">
    <img src="https://img.shields.io/website/https/hblock.molinero.dev.svg?label=nightly%20builds">
  </a>
  <a href="./LICENSE.md">
    <img src="https://img.shields.io/github/license/hectorm/hblock?label=license">
  </a>
</p>

## What is this for?

hBlock is a POSIX-compliant shell script that gets a list of domains that serve ads, tracking scripts and malware from [multiple sources](./SOURCES.md)
and creates a [hosts file](https://en.wikipedia.org/wiki/Hosts_(file)), [among other formats](./resources/alt-formats/), that prevents your system
from connecting to them.

## Installation

hBlock is available in various package managers. Please check the [PACKAGES.md](./PACKAGES.md) file for an up-to-date list.

The latest available version can also be installed manually by running the following commands:

```sh
curl -o /tmp/hblock 'https://raw.githubusercontent.com/hectorm/hblock/v3.1.3/hblock' \
  && echo '95dc0cd1c38ad97c1f929a7d18587a07b184b9357aad35d2c4d509ae0efb038b  /tmp/hblock' | shasum -c \
  && sudo mv /tmp/hblock /usr/local/bin/hblock \
  && sudo chown 0:0 /usr/local/bin/hblock \
  && sudo chmod 755 /usr/local/bin/hblock
```

Additionally, a [systemd timer](resources/systemd/) can be set to regularly update the hosts file for new additions.

## Usage

The default behavior of hBlock can be adjusted with multiple options. Use the `--help` option or check the [hblock.1.md](./hblock.1.md) file for the
full list.

[![asciicast](https://asciinema.org/a/b7C6FwnOXi7JUUz8sop4nR8TY.svg)](https://asciinema.org/a/b7C6FwnOXi7JUUz8sop4nR8TY)

## Nightly builds

Nightly builds of the hosts file, among other formats, can be found [on the hBlock website](https://hblock.molinero.dev).

## I found a false positive, what should I do?

It's possible that sometimes one of the hBlock sources includes a domain that shouldn't be blocked, in those cases the best way to proceed is to
temporarily add said domain to the allowlist and report the problem to the original blocklist author. This way it will also be automatically
removed from hBlock within 24h.

To find which blocklist is behind a false positive you can clone the [hMirror project](https://github.com/hectorm/hmirror) and search for that domain.
Although please note that not all hMirror blocklists are used by default in hBlock, an updated list of the sources used can be found in the
[SOURCES.md](./SOURCES.md) file.
