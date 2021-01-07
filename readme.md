# Docker SIFT image

Ubuntu-based docker image running [teamdfir's SIFT](https://github.com/teamdfir/sift-cli) in server mode (no GUI), as well as [volatility3](https://github.com/volatilityfoundation/volatility3).

# Image size

Running SIFT v1.9.2, the image is >5GB in size.

Installing SIFT can also take a while.

# Running the image

`docker run -it mrsheepsheep/sift:latest /bin/bash`

This will teleport you into the container as user `investigator`.

`investigator` is a passwordless sudoer.

Don't forget to bind volumes if needed.

`docker run -it -v /path/to/files:/data mrsheepsheep/sift:latest /bin/bash`

# Toolsuite compatibility

As the `sift-cli` tool was not intended to be run on Docker containers, some tools may
not work as expected and you may have to fix them manually
(for example, volatility2 community plugins).

Some python packages are missing, too (try running `rekall`).
