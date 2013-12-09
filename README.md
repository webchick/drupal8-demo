Drupal 8 Demo Script
====================

So. You want to show off Drupal 8 to your local user group/camp/company/etc? Here's just what you need! This consists of a presentation, demo script, and hopefully eventually some hands-on exercises you can get people to do.

One Drupal 8 Presentation to Rule Them All
------------

This presentation covers all of the major things that have happened in Drupal 8, from various different audience perspectives: end-users & clients, site builders, designers/front-end developers, and coders. It also provides some meta information about Drupal 8's release timeline and answers to various FAQs.

You can find the most up-to-date version of this presentation at:
https://docs.google.com/presentation/d/11B5vYbYs2dJrXT2_w8pUVFquK1tuxTHOXwqA-tUuF8Q/edit?usp=sharing

Grab a copy of it from File > Download As...

Note that this presentation is very long and detailed and gets into the weeds a lot. It is therefore **highly recommended** that you edit it down to fit into your specific timeframe/audience in a "real" presentation software.

Drupal 8 Demo script
-----
If you're less presentation-inclined, or you want to break up all the yammering with some actual demo stuff, this section is for you. Here are a variety of recommended walkthroughs for you.

### Pre-requisites
Download and edit the [cmi.sh](https://raw.github.com/webchickenator/drupal8-demo/master/cmi.sh) script to set up a local dev/prod Drupal 8 site, along with some patches of features not yet committed to core. You will need particularly this if you want to demo CMI. If you don't, you can still use it and then just do all of the below things on the production site. (These are all to be done on the production site unless otherwise specified.)

This script compares/contrasts D7 vs. D8. You may or may not want to do that in your own demo, preferring instead to just stick to Drupal 8. Up to you.

### Mobile navigation
  - #### D7:
    - Squish down browser window, show how toolbar stacks on top of itself.

  - #### D8:
    - Squish down browser window, show how toolbar flips orientation, then changes to icons at an even smaller size.

### Content creation
  - #### D7:
    - node/add/article.
    - Fill in content: "Hey, look! It's <strong>Lily!</strong>"
    - Scroll down, upload picture.
    - Copy/paste URL and manually insert <img> tag/link.
    - Full HTML!
    - Note how form endlessly scrolls, everything looks important.
    - Ew, two copies of the image.

  - #### D8:
    - node/add/article.
    - Note that optional settings are put off to the side.
    - Fill in content. OH LOOK, WYSIWYG. :)
    - Upload picture in WYSIWYG, enter alt text.
    - FULL HTML!!!
    - Show responsiveness.

### Content Editing
  - #### D7:
    - Edit tab.
    - Note that you are on something that doesn't look like your content.
    - Try to preview. Same content. Twice. In admin theme.

  - #### D8:
    - Click "Edit" icon. Note the pencils appear for contextual links.
    - Click into field. Change it. Save. DONE.
    - Turn off Quick Edit mode.

### Responsive Preview (*not* in core!)
  - #### D8:
    - On the topic of preview...
    - Click on mobile phone drop-down and select one.
    - Switch orientation
    - Scroll up/down.
    - Try another.
  - 
