# Craft Academy Site

[![Build Status](https://semaphoreci.com/api/v1/craftacademy/website/branches/master/shields_badge.svg)](https://semaphoreci.com/craftacademy/website)

This is a fork of the [Makers Academy Site](https://github.com/makersacademy/website)

## Setting up the site locally

* Clone the repo
* Run `bundle` to install gems
* Create a **.env** file - you can copy the [.env.example file](https://github.com/CraftAcademy/website/blob/master/.env.example) provided as an example to get you started
* Start the server with `middleman s`
* Go to __http://localhost:4567__ to view the site in your browser

> You'll need to run tests using `bundle exec rspec` rather than just `rspec`

## Deploying

* Make sure you have submitted a pull request and had it approved.
* Merge the pull request into master
* Once our [CI server](https://semaphoreci.com/craftacademy/website) has passed the tests, it will automatically deploy to the server by running the `middleman deploy` command provided by the [middleman-deploy extension](https://github.com/middleman-contrib/middleman-deploy). This builds a Middleman site and pushes the built site via rsync to the production path on the server.

## Technologies used

* [Ruby](https://www.ruby-lang.org/en/) as our server side language
* [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)/[jQuery](http://jquery.com/) for client side scripts
* [Middleman](https://middlemanapp.com/) for compiling our code into a static website
* [RSpec](http://rspec.info/) for testing
* [Sass](http://sass-lang.com/) to help write our CSS
* [Bourbon](http://bourbon.io/)/[Neat](http://neat.bourbon.io/)/[Bitters](http://bitters.bourbon.io/) as a framework for our CSS

## Adding images

Our images are stored on the [craft academy assets GitHub repo](https://github.com/CraftAcademy/craft-assets) - we've split them out to a seperate repository to keep the size of this repository down. All assets from that repository can be accessed from https://assets.craftacademy.se.

When adding a new image, add it to the [images directory](https://github.com/CraftAcademy/craft-assets/tree/gh-pages/images) of the [craft academy assets GitHub repo](https://github.com/CraftAcademy/craft-assets), and make sure that the image has been compressed using [image optim](https://imageoptim.com/) and are good quality images that fit the look and feel of the site.
