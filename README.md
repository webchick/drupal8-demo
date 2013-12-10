Showing off Drupal 8
====================

So. You want to show off Drupal 8 to your local user group/camp/company/etc? Here's just what you need! This consists of a presentation, demo script, and hopefully eventually some hands-on exercises you can get people to do.

One Drupal 8 Presentation to Rule Them All
------------

This presentation covers all of the major things that have happened in Drupal 8, from various different audience perspectives: end-users & clients, site builders, designers/front-end developers, and coders. It also provides some meta information about Drupal 8's release timeline and answers to various FAQs.

You can find the most up-to-date version of this presentation at:
https://docs.google.com/presentation/d/11B5vYbYs2dJrXT2_w8pUVFquK1tuxTHOXwqA-tUuF8Q/edit?usp=sharing

Grab a copy of it from File > Download As...

Note that this presentation is very long and detailed and gets into the weeds a lot. It is therefore **highly recommended** that you edit it down to fit into your specific timeframe/audience in a "real" presentation software.

Pre-requisites
----

1. Download and edit the [cmi.sh](https://raw.github.com/webchickenator/drupal8-demo/master/cmi.sh) script to set up a local dev/prod Drupal 8 site, along with some patches of features not yet committed to core. You will need particularly this if you want to demo CMI. If you don't, you can still use it and then just do all of the below things on the production site. (These are all to be done on the production site unless otherwise specified.)

2. Open two shell prompts one in the DEV webroot and one in the PROD web root, and set their background colours to two very different settings so that it's clear which is which. (I use "homebrew" for dev and "grass" for prod, personally)

3. Download and install Drupal 7, and point a browser tab at it: drush si --account-pass=admin --site-name="Drupal 7" -y

4. Open two more browser tabs, one at PROD and one at DEV.
5. Fire up Xcode and get the iPhone simulator working.
6. Download [Vancouver.jpg](https://github.com/webchickenator/drupal8-demo/blob/master/Vancouver.jpg) or your own (big!) image of choice to your desktop or whatever.

Drupal 8 Demo script
-----
NOTE: It is recommended to demo in Chrome, since that's what most core developers use. You'll hit bugs if you do some of this in Firefox, etc.

If you're less presentation-inclined, or you want to break up all the yammering with some actual demo stuff, this section is for you. Here are a variety of recommended walkthroughs for you.

This script compares/contrasts D7 vs. D8. You may or may not want to do that in your own demo, preferring instead to just stick to Drupal 8. Up to you.


### Content creation
  - #### D7:
    - node/add/article.
    - Fill in content:
      - **Title**: "It's Vancouver!"
      - **Tags**: mountains, ocean
      - **Body**: Here's the city of <strong>Vancver</strong> in all of its splendor! (note: typo on purpose :))
      - Come visit us anytime!
    - Scroll down to **Image**, upload picture.
    - Copy/paste URL and manually insert <img> tag.
    - Note how form endlessly scrolls, everything looks important.
    - Picture not showing up in body... remember to select Full HTML!
    - Save!
    - Oh no! Two copies of the image, one is HUGE. :(

  - #### D8:
    - node/add/article.
    - New content creation page! Note that optional settings are put off to the side.
    - Fill in content, as above. (REMEMBER THE TYPO!)
    - OH LOOK, WYSIWYG. :) Show off that bold button!
    - Upload picture in WYSIWYG, enter alt text, check off caption box.
    - Enter caption "Vancouver, BC, Canada", hit enter.
    - Done-zo! Save.

### Content Editing
  - #### D7:
    - Now let's fix the typo. Go to the Edit tab.
    - Note that you are on something that doesn't look at all like your content.
    - Try to preview. Same content. Twice. In admin theme. :\

  - #### D8:
    - Click "Edit" icon. Note the pencils appear for contextual links.
    - Click into Body field. Change it.
    - Click into Tags field, add more tags ("awesomeness"). Save. DONE.
    - Turn off Quick Edit mode.


### Mobile navigation
  - #### D7:
    - Squish down browser window, show how toolbar stacks on top of itself.
    - Open in iOS simulator. OH DEAR GOD NO. Website is *tiny*... Picture breaking layout.
    - Zoom in, demonstrate how toolbar takes up 7/8ths of the screen

  - #### D8:
    - Squish down browser window, show how toolbar flips orientation, then changes to icons at an even smaller size.
    - Note responsive images resizing as well.
    - Open in iOS simulator, demonstrate toolbar icons + quick edit works.


### Responsive Preview (D8 only; *not* in core!)
  - On the topic of preview...
  - Click on mobile phone drop-down and select one (iPhone 5).
  - Switch orientation
  - Scroll up/down.
  - Try another (Nexus 4).
  - Show config page that lets you define your own.



### CMI (D8 only)
  - On **DEV**:
    - First, the simple case: deploy a site slogan.
    - Go to admin/config/system/site-information and add a slogan.
    - Go to admin/config/development/configuration, click Single Import/Export, "Simple configuration," "system.site," Export button to download.
    - Switch to command line, cd into DEV wwwroot, run "git diff" to see the changes. Commit them.
  - On **PROD**:
    - Go to admin/config/development/configuration and upload the tarball you just exported.
    - Click on "View differences" to show they match up with what was in Git.
    - Click "Import all" aaaaand... slogan change!
    - Switch to command line, cd into PROD wwwroot, run "git diff" to see the changes. Commit them.
  - On **DEV**:
    - Now for something fancier: Create a content type (named something alphabetically later than "H" so that it shows up after "Home" :)), add a field, create a page view (WITH MENU LINK) of that content type.
    - Go to admin/config/development/configuration, click Full Import/Export, export button to download.
    - Switch to command line, cd into DEV wwwroot, run "git diff" to see the changes. Commit them.
  - On **PROD**:
    - Repeat above steps. You should see the view show up! Oooh, ahhh...


### Web Services (D8 only; TODO... conceptual/hand-waving code is in https://github.com/webchickenator/d8ws/tree/full-metal-handwaving)
  - Conceptually, on DEV:
    - Enable all of the various RESTful modules
    - Add a REST export to Front page view.
    - Create a Cordova/jQuery Mobile app that hits that URL and allows you to add/edit the things and post them back.
    - Demo it!
    - Deploy it to PROD! :)
