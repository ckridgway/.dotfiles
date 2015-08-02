
if [ "$PKG_MANAGER" == "brew" ]
then 
	brew tap dart-lang/dart
	brew install dart --with-content-shell --with-dartium
fi

if [ "$PKG_MANAGER" == "apt-get" ]
then
	sudo apt-get update
	sudo apt-get install apt-transport-https
	sudo sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
	sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
	sudo apt-get update

	sudo apt-get install dart
fi
