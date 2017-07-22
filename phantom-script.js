var system = require('system');
var args = system.args;

// Example of how to get arguments passed from node script
// args[0] would be this file's name: phantom-script.js
var unusedArg = args[1];

// Send some info node's childProcess' stdout

var url = 'https://www.google.com';
var page = require('webpage').create();

page.open(url, function(status) {
  if( status != 'success') {
    console.log("failed to retrieve page of " + url);
  } else {
    var title = page.evaluate(function() {
      return document.title;
    });
    console.log("Title is : " + title);
  }

  phantom.exit();

});

