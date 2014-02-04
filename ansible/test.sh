#!/bin/sh
echo "Test java installed..."
	java=$(java -version 2>&1 | awk '/version/{print $NF}')
    if( echo $java | grep "1.6") 
    then
        echo "Java 1.6 is installed..." 
    else
        echo "Java is not installed..."
		exit 1
    fi

echo "Test ruby installed..."
	if( /usr/local/bin/ruby -v )
	then
		echo "ruby is installed..."
	else
		echo "ruby is not installed..."
		exit 1
	fi
	
echo "Test rubygem installed..."
	if( sudo /usr/local/bin/gem install rubygems-test )
	then
		echo "rubygem is installed..."
	else
		echo "rubygem is not installed..."
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
   	
echo "Test solr started..."
	if( $(curl -s --head  --request GET http://localhost:8983/solr/admin/ping | grep "200 OK" > /dev/null ) )
	then
   		echo "solr started"
   	elif(  $(curl -s --head  --request GET http://localhost:8983/solr/admin/ping | grep "404" > /dev/null ) )
   	then
   		echo "solr broken"
   	else
   		echo "solr not started..."
   		exit 1
   	fi

echo "Test blacklight-core installed..."
	if( $(curl -s --head  --request GET http://localhost:8983/solr/blacklight-core/admin/ping | grep "200 OK" > /dev/null )  )
	then
   		echo "blacklight-core installed"
   	else
   		echo "blacklight-core not started..."
   		exit 1
   	fi

echo "Test rails started..."
	if( $(curl -s --head  --request GET http://localhost:3000 | grep "200 OK" > /dev/null ) )
	then
   		echo "rails started"
   	else
   		echo "rails not started..."
   		exit 1
   	fi   	 	