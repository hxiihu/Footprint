Overview
Scope of the project / Ideation

Our project aims to provide a website to record travellers' photos, routes, ramdom thoughts and travelogues and provide a map-based view to organise everything. We are aiming for Project Gemini.

Motivation 

Many people are travelling enthusiasts. 

At the end of the day, travellers want to have a nice way to store and view all the information about their travel experiences including the photos, routes and travelogues.

Travellers may choose to record their routes on Google My Maps, store photos by using personal cloud storage service, and even put their travelogues in their personal blogs.

But these ways have their limitations as they are lack of ability to put everything together. On map-based website, travellers can't link their photos and articles directly to locations while looking through the blogs or albums, it is not intuitive to get an overview of a particular travel.

Our project hope to provide a one-stop website that can put travelling information (e.g. photos, locations, routes, travelogues) together and present them nicely.

More features will be shown in User story part.

Proposed level of achievement
Gemini.

YouTube link to our ignition presentation

[NUS Orbital 2015] Ignition 

Video demonstration

https://youtu.be/WpC7Bui583Y

App Link: yurilliam.footprint.com
Footprint 

Planned Features
The features that we are going to implement is listed below. By following Ruby on Rails tutorial, we have implemented a rails app with basic functionalities. The core features are listed in 「planned features」， which can make our app fully functional, yet is small enough in terms of amount of effort that we can achieve. If time allows, we will try to implement more advanced features listed in 「optional features」.

Besides, our app is already under version control using Git. The code is stored on bitbucket. We also hope to include user testing after first deployment if time is allowed.

Features finished up to now

User login/logout
full authentication framework including account acctivation and password reset
Change of personal infomation
Use SSL in production
Allow following users
Enhanced security
Add a timeline mode
Post of status/text
Post of pictures
An animated world map
Planned features

Store map information in conjuction with each user
Log in via Facebook
click on states on map to locate each status
Seed an email back to the development team via Feedback page
Share to other SNS (Social Media Sites)
Advanced Plan:

Use Microsoft's face detection API
Allow users to determine whether to share his/her profile page
Data minging | to suggest users to follow 
User can export routes map into picture/pdf


User Story
As a user, I can create an account or reset my password via email validation.

Current status: We created an authentication system which enables users to sign up, login and logout of their individual accounts. This system utilises the bcrypt hash function to secure passwords of users.

When signing up, Footprint ensures account's validity and uniqueness and implements exception handling.  Users will be prompted to fulfil said requirements if the submitted fields do not meet the requirements.

We also implement account validation and password reset via user's email.

Future plans: We want to allow Facebook/open ID login.

As a user, I will also be able to upload text and images on Footprint.

Current status: We implement a Post model to allow users to post their text/images on Footprint, and are represented in a time-based way.We made use of an existing gem Carrierwave + fog and the photos are stalled on amazon AWS S3 bucket. Images should be below the size of 5Mb.

Future plans: We want to allow users to create a single trip and divde their posts into different groups based on different trips.

As a user, I can follow my friends on Footprint.

Current status:  User can follow or unfollow other friends on Footprint. On their own home pages, users are able to feeds. Meanwhile.

As a user, I only need to login one time on one machine.

Current status:  After implementing cookies with hashing, when signing in, users have the option of checking the remember me checkbox. After clicking that box, the user enters a session created using the Rails method cookies. The session of the user is remembered even after the browser is closed and the session is expired only when the user logouts explicitly. 

As a user, I want my data to be securely protected.

Current status:  Since our application is running on a Heroku domain, we make use of Heroku’s SSL certificate and enable HTTPS request. 
Future plans: From back-end side, we will write some security code to prevent SQL injection.
As an administrator, I need an administrative front end.

Current status:  We add an administrative front end for Footprint. The administrator can view the whole user list. In addtion, they can delete non-administrative users in associated with all of their posts.
As a user, I can export my maps to the Footprint.

Current status: In progress. After studying embedded map on a web page, We find it hard to implement a map editor. So our least goal is to allow user to import their own map to our website.
Future plans:  If possible, we will make use of Mapbox.js and write a GUI to implement a online map editor.
As a user, I can share my experience to other social media sites.

Current status: In progress. We want to allow users to share their single post/trip to other social media sites like Facebook or Tweeter.


Reference used
For learning:

Ruby on Rails - Ruby on Rails Tutorial by Michael Hartl
HTML/CSS - Learn HTML/CSS on Codecademy
Ruby - Learn Ruby on Codecademy
JS - JavaScript Tutorial
Front-end reference : W3school
Question and Help: stackoverflow.com 
Eloquent JavaScript - Eloquent JavaScript
MapBox - MapBox
For the development of Footprint:

cloud IDE - cloud9
app deployment - Heroku
front-end - bootstrap

Project Log:
 

Docs.google

 

Reference of Participaton

Github: https://github.com/TomasAnderson

Github: https://github.com/xiihu/Footprint

Bitbucket: https://bitbucket.org/xiihu

Stack Overflow:http://stackoverflow.com/questions/27949158/heroku-missing-required-arguments-aws-access-key-id-aws-secret-access-key-f/30691540#30691540