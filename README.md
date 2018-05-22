# TODO list app

## Features
 
1. `✔` Users​ ​can​ ​view​ ​their​ ​todo​ ​list.
2. `✔` Users​ can​ ​~add,​ ​remove,​ ​modify​ ​and​ ​delete​ ​todo​ ​entries.
3. `✔` Each​ ​todo​ ​entry​ ​includes​ ​a ​single​ ​line​ ​of​ ​text,​ ​due​ ​date​ ​and​ ​priority.
4. `✔` Users​ ​can​ ​assign​ ​priorities​ ​and​ ​due​ ​dates​ ​to​ ​the​ ​entries.
5. `✔` Users​ ​can​ ​sort​ ​todo​ ​lists​ ​using​ ​due​ ​date​ ​and​ ​priority.
6. `✔` Users​ ​can​ ​mark​ ​an​ ​entry​ ​as​ ​completed.

OPTIONAL: 

8. `✔` Provide​ a ​RESTful​ API​ which​ will​ allow​ a ​third-party​ application​ to​ trigger​ actions​ on​ your app​ (same​ actions​ available​ in​ the​ app). 
9. `✔` Provide​ authentication​ and​ authorization​ service​ for​ both​ the​ app​ and​ the​ API.
10. `✔` As​ complementary​ to​ the​ last​ item,​ one​ should​ be​ able​ to​ create​ users​ in​ the​ system​ via an​ interface,​ probably​ a ​signup/register​ screen.

## Dependencies

- Ruby 2.5.0
- Rails 5.2.0
- PostgreSQL
- Turbolinks
- RSpec
- Capistrano

## Installation
Steps:

    $ bundle

Create user `todos` in PostgreSQL with DB `todos`:

    $ sudo su postgres
    $ createuser -S -d -R -e -l -P todos

File `db/database.yml` uses credentials from `secrets.yml`. it __is__ supposed to be in repository and it should be __unchanged__. Edit `secrets.yml` to set your credentials. Keep all secrets inside `secrets.yml` as it's added to `.gitignore`.

Create DB, run migrations and seed (if any seeds) for test & development:

    $ rails db:setup
    $ RAILS_ENV=test rails db:setup

## Usage

**Start**

To start Rails server with autotesting (Guard with Rspec) and Livereload just use:

    $ bundle exec guard

**API**

API is JSON:API compilant with user token and email auth.

### Code:

Use `rails notes` to see TODO, FIXME, OPTIMIZE comments.

## Deploy

Use Capistrano
