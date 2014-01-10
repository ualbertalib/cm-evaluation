#!/bin/sh
echo "Test java installed..."
    if( java -version | grep "java version") 
    then
        echo $java 
    else
        echo "Java is not installed..."
		exit 1
    fi

echo "Test ruby installed..."
	if( /usr/local/bin/ruby -v )
	then
		echo $ruby
	else
		echo "ruby is not installed..."
		exit 1
	fi
	
echo "Test rubygem installed..."
	if( sudo /usr/local/bin/gem install rubygems-test )
	then
		echo $rubygem
	else
		echo "ruby is not installed..."
		exit 1
	fi
	
echo "Test bundler gem installed..."
	if( /usr/local/bin/gem list bundler -i )
	then
		echo "bundler installed"
	else
		echo "bundler not installed..."
		exit 1
	fi
	
echo "Test rails gem installed..."
	if( /usr/local/bin/gem list rails -i )
	then
		echo "rails installed"
	else
		echo "rails not installed..."
		exit 1
	fi	