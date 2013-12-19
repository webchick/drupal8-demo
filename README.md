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
7. **LOG IN** to all the sites, on both desktop + mobile.

For best results, *three desktops*: 1) presentation, 2) browser w/ D7 / D8 prod / D8 dev tabs, 3) iOS+Terminal


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

### General code changes
The Pants module is a nice example of a D7 "before and after" to D8 port which exercises most of the major APIs.  It includes a detailed commit log that explains all the steps taken one by one, along with references to the relevant issue summaries.

Here are some relevant commitdiffs for showing off the new changes in D8.

1. Get D7 and D8 versions of the Pants module:
git clone --branch 7.x-1.x http://git.drupal.org/project/pants.git
git clone --branch 8.x-a4 http://git.drupal.org/project/pants.git

2. See a log of all the things that were converted in the process of porting:
http://drupalcode.org/project/pants.git/shortlog/9dfb670105b1bae26163e002419e5a0aa3a6d00d

3. Specific diffs of some of the larger changes:

.info files => .info.yml files http://drupalcode.org/project/pants.git/commitdiff/9358fe4626260693652192a299da2f8acbbae108

files[] => PSR-0 / PSR-4 for OO code: 
http://drupalcode.org/project/pants.git/commitdiff/4a11b2c1f4b0b476e7e3ad80ebc587310b7547f8

New routing system
http://drupalcode.org/project/pants.git/commitdiff/683df063549a6a0cfc6923ca8f04866a0d84ee4b

New OO form API:
http://drupalcode.org/project/pants.git/commitdiff/852c96a4d5101d720b28ca8e29335bb2e052cb9f

New configuration system:
http://drupalcode.org/project/pants.git/commitdiff/b7cdd253b4a1e2fdfe4a5fcfd7702b85e2fc5950 http://drupalcode.org/project/pants.git/commitdiff/8053ac1714217f335146d5302dffd715e09fe176

New OO field/entity API:
http://drupalcode.org/project/pants.git/commitdiff/764dc69fe9408863c3f7faaddd2ad977994551b9

New plugins system:
http://drupalcode.org/project/pants.git/commitdiff/0a3385132b03bebd501374a2840b005edc9405c4
http://drupalcode.org/project/pants.git/commitdiff/96a85f994c145849cfc4ffffb246a7bf25753128

…as used on blocks:
http://drupalcode.org/project/pants.git/commitdiff/963fe182d9dd781ed03f3d1c01d18bfe9d3e9463

Views as config entities:
http://drupalcode.org/project/pants.git/commitdiff/6bcb751ad136fe00513df520ddf15afe435dc50e


