#gophrz

gophrz (*pronounced "Gophers"*) is a simple bash script binary that will install and manage the [**Go programming language**](https://golang.org) on your linux system.

The script supports bash and zsh.

You can install different go versions and manage them in your shell.
You can switch between different go versions.
You can completely uninstall/purge go from your system.

By default, the script will find the latest version of 64-bit Go and install to your system.

##How to install gophrz

### Using gophrz binary

To install the gophrz binary simply run the following command:

`wget -qO- https://goo.gl/NG1RKa | sh`

To test the gophrz install was successful, type `gophrz` into the command line:

    user@yourserver:~$ gophrz
    Please either choose a go version with '-v' or pass the '-d' flag for the default latest version

        usage: gophrz [ -v version -b 32/64 -d -p -h ]
            -v --> Particular Go version < ex. 0.4.2
            -b --> Bit Version of Go < 32 or 64(default)
            -d --> Latest Stable Go version
            -p --> Deletes Go in its entirety from your system
            -h --> print this help screen


### Compatibility

| OS         | Versions|
|------------|---------|
| Mac OSX    | 10.8+   |
| RHEL/CentOs| 6+      |
| Debian     | 7+      |   
| Ubuntu     | 13.04+  | 
| Fedora     | 20+     |

*"+" symbol denotes any version after the one listed* 

**The gophrz binary should work on most linux distros. If you are having trouble with the install try the bash script below.**

### Using the bash script

Download gophrz bash script:  

[**gophrz linux script**](https://raw.githubusercontent.com/badmadrad/gophrz/master/gophrz.sh)  

or  

[**gophrz mac script**](https://github.com/badmadrad/gophrz/raw/master/gophrz-mac.sh)

Make script executable:  

`chmod 700 gophrz.sh`

### Basic Usage

*bash script is used by calling `./gophrz.sh`*

To see script usage and help information:

`gophrz -h`

To install LATEST go version (64-bit default):

`gophrz -d`

To install a different version (64-bit default):

`gophrz -v 1.3.1`

To install 32 bit (will install LATEST):

`gophrz -b 32`

To install different version and 32 bit:

`gophrz -v 1.3.1 -b 32`

To purge go from your system:

`gophrz -p`

##Switching Go Versions

To switch versions simply specify the version you want to switch to:
`gophrz -v 1.4.1`

gophrz will install the specified version if it's not on your system. However, if a prior installed version exists, it will switch to that version by changing GOROOT to the existing location on your system.

**You may have to log out and back into the shell for changes to take effect.**

## Environment Variables

All your Go versions are saved here: `$HOME/.go`

gophrz will set `$GOROOT` to the version you specify. 

gophrz will set your go workspace or  `$GOPATH` to `$HOME/go`

## Uninstalling gophrz

To remove/purge changes made by gophrz:

`gophrz -p`

To remove gophrz itself:

`wget -qO- https://raw.githubusercontent.com/badmadrad/gophrz/master/uninstall.sh | sh`

## Issues

Any weird issues or concerns please let me know in the project issues.

## License

[See License](https://github.com/badmadrad/gophrz/blob/master/LICENSE)
