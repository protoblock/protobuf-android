#!/bin/bash
#
#
# 88""Yb 88""Yb  dP"Yb  888888  dP"Yb  88""Yb 88      dP"Yb   dP""b8 88  dP 
# 88__dP 88__dP dP   Yb   88   dP   Yb 88__dP 88     dP   Yb dP   `" 88odP  
# 88"""  88"Yb  Yb   dP   88   Yb   dP 88""Yb 88  .o Yb   dP Yb      88"Yb  
# 88     88  Yb  YbodP    88    YbodP  88oodP 88ood8  YbodP   YboodP 88  Yb                                                                                                                       '                   
#
# 080 114 111 116 111 098 108 111 099 107
# 01010000 01110010 01101111 01110100 01101111 01000010 01101100 01101111 01100011 01101011
#
# contact@protoblock.com
#
# FIXME make options to pass in for the following
# + ndk root location
# + android cross build usr path
# + Version of protobuf to build
# 
#
# FIXME pkgconf is not working oob
#



printHelp(){
cat << _EOF_
#______________________________________________________________ #
#    ____                                                       #
#    /    )                          /     /               /    #
#---/____/---)__----__--_/_----__---/__---/----__----__---/-__- #
#  /        /   ) /   ) /    /   ) /   ) /   /   ) /   ' /(     #
#_/________/_____(___/_(_ __(___/_(___/_/___(___/_(___ _/___\__ #
#								#
#______________________________________________________________ #
#								#                                                              

```````````````````````````````````````````````````````````

NOTE YOU CAN ONLY USE THIS TO BUILD PROTOBUF 2.6.1 
This is to match our android toolkits

This installs to /usr/local/protobuf_2_6_1

```````````````````````````````````````````````````````````


Usage 
$0 [option]
 
 Options
		[ --debug, -d , -v --verbose ]
			Print std out in debug mode
 		
 		[ --release, -r ]
			Print std in release mode

		[ --help, -h, h , ? ]
			Print this help

 
Eample: 
	$0 -r
_EOF_
exit 1;
}



if [ $# -lt 1 ]; 
then
	printHelp;
fi


DEBUG=0;
case "$1" in
    -d|--debug|d|v|--verbose)
    	DEBUG=1
    ;;
    -r|--release)
		DEBUG=0
	;;
        -h|--help|h|?)
    	printHelp;
    ;;
    *)
		printHelp
	;;
esac


# FIXME debug
if [ $DEBUG == 1 ];
 then
 		set -x
fi

##########################################
# Download Protobuf
##########################################

cd /tmp
rm /tmp/protobuf-2.6.1.tar.*
if [ -d /tmp/protobuf-2.6.1 ];
then
	rm -rf /tmp/protobuf-2.6.1
fi

wget https://github.com/google/protobuf/releases/download/v2.6.1/protobuf-2.6.1.tar.gz
echo "Extracting protobuf 2.6.1"
tar xf /tmp/protobuf-2.6.1.tar.gz

cd /tmp/protobuf-2.6.1/


if [ $DEBUG == 0 ];
then 
./configure --prefix=/usr/local/protobuf_2_6_1
else
./configure --prefix=/usr/local/protobuf_2_6_1 \ 
CXXFLAGS="-m32 -g3 -ggdb3"
fi

make -j6
make install