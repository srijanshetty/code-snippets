#!/usr/local/bin/env node

var fs = require('fs'),
    https = require('https'),
    exec = require('child_process').exec;

// Get the username
var user = process.argv[2];
if (!user) {
    console.log('ERROR: Enter username');
}

function fetch(page, callback) {
  https.get({
    host: 'api.github.com',
    path: '/users/' + encodeURIComponent(user) + '/gists?page=' + page,
    headers: {'User-Agent': 'node'}
  }, function(response) {
    var body = [];
    response
        .on('data', function(data) { body.push(data); })
        .on('end', function() { callback(null, JSON.parse(body.join(''))); })
        .setEncoding('utf8');
  }).on('error', function(error) {
    callback(error, null);
  });
}

function directoryExists(path) {
  try {
    return fs.lstatSync(path).isDirectory();
  } catch (ignored) {
    return false;
  }
}

function fetchAndClone(page, callback) {
  fetch(page, function(error, gists) {
    if (error) {
        return callback(error);
    }

    if (gists.length) {
        ++page;
    } else {
        page = -1;
    }

    function cloneNext(gist) {
      if (!gist) {
          return callback(null, page);
      }

      if (directoryExists(gist.id)) {
          return cloneNext(gists.pop());
      }

      console.log('cloning ' + gist.id);
      exec('git clone git@gist.github.com:' + gist.id + '.git', function(error) {
        if (error) {
            return callback(error);
        }

        cloneNext(gists.pop());
      });
    }

    cloneNext(gists.pop());
  });
}

fetchAndClone(1, function callback(error, nextPage) {
  if (error) {
      return console.error(error);
  }

  if (nextPage > 0) {
      fetchAndClone(nextPage, callback);
  }
});

