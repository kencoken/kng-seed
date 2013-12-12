kng-seed
========

Seed for basic angular frontend project, based on `angular-seed`
using an added grunt/bower pipeline.

Tests are in coffeescript, and the angular code is in plain JS,
with optional coffeescript versions provided in `app/coffee/`

Usage
-----

First ensure the following global packages are installed:

 * `bower`
 * `coffee-script`
 * `less`

And for testing and automated compilation:

 * `karma`
 * `phantomjs`
 * `grunt-cli`

To install the frontend dependencies:

    $ bower install

To compile all less/coffeescript:

    $ npm install
    $ grunt

To run all tests:

    $ grunt test

