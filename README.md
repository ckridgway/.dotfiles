Bootstrap my home on OSX and Linux.

	git clone https://github.com/ckridgway/.dotfiles ~/.dotfiles && cd ~/.dotfiles && ./bootstrap.sh


Conventions:

	- Folders:
		- bin      - Files in bin are symlinked into ~/bin (which is on PATH)
		- *        - All other folders are considered for both

	- The bootstrapper will install packages for any files that take the form:

		<package-name>.install[-<os>]

	  where:

	  	package-name: is the name of the package to install
	  	          os: restricts install to the specified operating system
	  	              (osx or linux)

