lambda-node-phantom
===

A simple working example of running PhantomJS on AWS Lambda via NodeJS
---

This repository contains a complete, working example of running a simple PhantomJS script on AWS Lambda through a NodeJS child process.

* Step 1, clone this repository. If you download the zip file, make sure you don't use the zip file directory for AWS Lambda.
* Step 2, download phantomjs from their official website. To reduce the size of the code base, phantomjs executable binary has been removed. You can use prepare.sh script to help download the binary. The script is written in bash4.
* Step 3, [compress the contents of the folder](http://stackoverflow.com/a/34640743/2282538), and upload the zip file to an AWS Lambda function.
* Step 4, test the lambda function within AWS console. If everything works fine, you can see this as the result on your console:
```
Title is : Google
```

Test the script
---
In case you have any issues with the Lambda function, you can test the phantom script locally before putting it onto AWS console. Simple run: 
```
$phantomjs phantom-script.js
```
And see whether you have the current output.
