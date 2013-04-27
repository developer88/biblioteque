# Biblioteque

![Travis-ci](https://travis-ci.org/developer88/biblioteque.png)   ![Codeclimate](https://codeclimate.com/github/developer88/biblioteque.png)

Biblioteque is a little gem that provides all necessary methods to create  databases of files stored in local directories.

## Usage example

    require 'biblioteque'
    engine = Biblioteque::Engine.new

Now we can create a new database:

    engine.create_db("<DBname>", "<PathToDatabaseFile>")

then we need to load created db:

    db = engine.load_db("<PathToDatabaseFile>")

Let's add a new library:

    db.create_library("<LibraryName>")

and load it:

    library = db.libraries.first

and import files information into it:

    library.add("<PathToCrawlForFiles>")

Now, we can search for added files in a library:

    library.search('<FileNameOrPatternToSearch>')

or in entiry database:

    db.search('<FileNameOrPatternToSearch>')

Oh! and do not forget to save all the changes:

    db.save


## Dependencies

This project doesn't have any runtime dependencies, only Ruby 1.9.3+.
During development, the dependencies are: redcarpet, yard, mocha.

## Installation

Add this line to your application's Gemfile:

    gem 'biblioteque'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install biblioteque

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
