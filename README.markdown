# BarCampLive

*A Simple BarCamp Scheduler*

Originally created for BarCampOrlando 2008, this scheduler provides a simple interface for BarCamp attendees to use during the event to check the schedule and see upcoming talks.


## Getting Started with BarCampLive

To create and populate the database, execute the following commands at the command line from within the app:

  * `rake db:create`
  * `rake db:schema:load`
  * `rake populate:2009`

This will give you a nice starting point. The data set is from BarCampOrlando 2009, but the populate task should be easy enough to modify for your own events.

Next, start the development server and check out the app in your browser:

  * `./script/server`
  * `open http://localhost:3000/`
