Information Systems Laboratory
==============================

The Jekyll-based website of Information Systems Laboratory.


Updating content
----------------

Requirements:

* Create an account on GitHub.
* Send me your login to add you push privileges.

Using *git* from command line:

1. Update the website page:
  1. Edit `_data/*.yml` file if you want to add or update a member, seminar or tool.
  2. Edit `_bibliography/members/*.bib` to update a bibliography.
  2. Edit `_bibliography/theses.bib` to update the list of thesis.
  3. Edit `.md` files to update the content of static pages.
  4. Add PDF file into `_uploads` directory (keep them as small as possible!) or just send them to me via email.
2. Commit and push your edits into repository.
3. Send me an email to update the website on the faculty server (as I don't know if you have privileges to do it).

You can do it online as well using http://prose.io


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

