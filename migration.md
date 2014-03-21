# Rails Migration
http://guides.rubyonrails.org/migrations.html

## Migrations methods:
* add_column
* add_index
* change_column
* change_table
* create_table
* drop_table
* remove_column
* remove_index
* rename_column

Basic format
YYYYMMDDHHMMSS_create_products.rb

## Supported types

* :binary
* :boolean
* :date
* :datetime
* :decimal
* :float
* :integer
* :primary_key
* :string
* :text
* :time
* :timestamp
especial type:
* :references

## create_table

### Commands to create migrations

``` 
$ rails generate model Product name:string description:text
$ rails generate migration AddPartNumberToProducts part_number:string
$ rails generate migration RemovePartNumberFromProducts part_number:string
$ rails generate migration AddDetailsToProducts part_number:string price:decimal
```

## change_table
* add_column
* add_index
* add_timestamps
* create_table
* remove_timestamps
* rename_column
* rename_index
* rename_table

## Running Migrations
```
$ rake db:migrate VERSION=20080906120000
$ rake db:rollback
$ rake db:rollback STEP=3
$ rake db:migrate:redo STEP=3
$ rake db:reset  #drop database and recreate it
$ rake db:migrate:up VERSION=20080906120000
```

## Migrations commands
```
rake db:migrate         # Migrate the database (options: VERSION=x, VERBOSE=false).
rake db:migrate:status  # Display status of migrations
rake db:rollback        # Rolls the schema back to the previous version (specify steps w/ STEP=n).
rake db:test:prepare    # Rebuild it from scratch according to the specs defined in the development database
```

## more Database commands (rake -T db)
```
rake db:create          # Create the database from config/database.yml for the current Rails.env (use db:create:all to create all dbs in t...
rake db:drop            # Drops the database for the current Rails.env (use db:drop:all to drop all databases)
rake db:fixtures:load   # Load fixtures into the current environment's database.
rake db:schema:dump     # Create a db/schema.rb file that can be portably used against any DB supported by AR
rake db:schema:load     # Load a schema.rb file into the database
rake db:seed            # Load the seed data from db/seeds.rb
rake db:setup           # Create the database, load the schema, and initialize with the seed data (use db:reset to also drop the db first)
rake db:structure:dump  # Dump the database structure to db/structure.sql. Specify another file with DB_STRUCTURE=db/my_structure.sql
rake db:version         # Retrieves the current schema version number
```