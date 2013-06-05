plugin_name = java-jce-unlimited-plugin
publish_bucket = cloudbees-clickstack
publish_repo = testing
publish_url = s3://$(publish_bucket)/$(publish_repo)/

deps = lib/local_policy.jar lib/US_export_policy.jar

pkg_files = functions lib LICENSE setup

java_jce_unlimited_src = 

include plugin.mk

clean: clean-deps clean-pkg
	rm -rf lib
		
lib/US_export_policy.jar:
	mkdir -p lib
	cp -f "$(java_jce_unlimited_src)" lib/jce_unlimited.zip 
	unzip -d lib lib/jce_unlimited.zip */US_export_policy.jar
	mv lib/*/US_export_policy.jar lib
	rm -r lib/jce_unlimited.zip 
			
lib/local_policy.jar:
	mkdir -p lib
	#curl -fLo lib/jce_unlimited.zip "$(java_jce_unlimited_src)"
	cp -f "$(java_jce_unlimited_src)" lib/jce_unlimited.zip 
	unzip -d lib lib/jce_unlimited.zip */local_policy.jar
	mv lib/*/local_policy.jar lib
	rm -r lib/jce_unlimited.zip 
	
