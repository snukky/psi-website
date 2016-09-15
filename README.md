Information Systems Laboratory
==============================

The Jekyll-based website of Information Systems Laboratory.


Updating content
----------------

1. Update the website page:
  1. Edit `_data/*.yml` file if you want to add or update a member, seminar or tool.
  2. Edit `_bibliography/members/*.bib` to update a bibliography.
  3. Edit `.md` files to update the content of static pages.
2. Commit and push your edits into repository.
3. Send me an email to update the website on the faculty server (as I don't know if you have privileges to do it).


Building the website
--------------------

Attention: building the website locally is not needed to update its content.
Be aware that the commands below have not been yet tested on a fresh system setting.

Requirements:

* Ruby
* Ruby Bundler
* Jekyll

Type `bundle install` to install all required gems.

To build it on Unix machines use the provided Makefile:

  make build

To run it locally:

  make run

Or check what commands are executed by the Makefile.

Assets (i.e. images, CSS styles, icons, etc.) should be stored in `_assets` directory.


TODO
----

* Where to place PDF files?
* Create a script for automatic building on the server.

