ShakeHack
=========

**Material from the Shakespearean Hackfest Dec 06 2014**

##Group 3

More info at https://docs.google.com/document/d/1AI1ouoR5qnjsymN79EQryneGJ5LBh9R05YLRdq-ckmc/edit#

General idea is to compare characters' styles across Hamlet and possibly later with other plays. 
First just in general, later taking into account characteristics like gender, social position, subplot etc

  * We first extracted all utterances spoken by the characters (via XSLT script), thanks to our XSLT expert.
  * This was formattted as 1 line per character, tab separated, column 1 person name, column 2 number of times the character spoke in the play, column3 all the character’s speeches merged into one
  * Next step was to import into R, but we run into problems with newline differences across systems; quick & dirty solution was to import into Open office spreadsheet and export again
  * R immediately gives us some statistics: like speakers sorted by their frequency, now we try to find word frequency for every speaker.
  * Our Shakespeare expert categorized the characters by gender, class, and other factors which we did not have time to investigate.
  * Our R expert helped with using the R package "Stylo". This package clustered the characters into groups depending on the style of their utterances. 
  * We also tried to colour the labels of the clusters by their class category, but didn't succceed.

##Conclusions##  
We found interesting promising preliminary results. One cluster contains Hamlet together with some small roles. The middle cluster contains predominanlty courtiers, (with Gertrude and the ghost interestingly together). The last cluster is heterogeneous, with 
many professions.
