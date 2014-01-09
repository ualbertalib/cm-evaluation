#!/bin/sh
echo "Test java installed..."
    if( java -version | grep "java version") 
    then
        echo $java 
    else
        echo "Java is not installed..."
	exit 1
    fi
