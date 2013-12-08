#Captioner
##Makers Academy Week 9 Project


###Aim

The aim of this project was to further practice Rails by building an Instagram-style app. 

Darrell and I added a twist to it by attempting to develop a caption competition website, where users tried to compete to post the most interesting caption. 



###Other details

The task was set by Alex Peattie, [@alexpeattie](http://www.github.com/alexpeattie)

I paired with Darrell Wilkins, [@dwkns](http://www.github.com/dwkns)

Technologies used in this app include:

* SQLite
* Devise
* Paperclip, for image management
* Imagemagik, for image processing
* Stripe API
* Twitter Bootstrap


###Features

* Visitors to the homepage see small thumbnails of previously uploaded images, in the style of a Polaroid
* User management using Devise
* Signed in users can upload new images, including a description and tags
* Users can filter images by tags
* Users can view individual image pages
* On these image pages, visitors can submit captions
* When a caption is submitted, a copy of the image is reproduced with a comic-style border and caption superimposed
* Users can 'order prints' of images they like through the Stripe API

###To do

* Enable users to dynamically cyle through submitted captions 
* Add a voting feature for the captions. The most popular caption will be displayed by default
* Refactor code 