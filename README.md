# React and Rails challenge

Challenge to assess your skills in React and Rails.

## The current status

This is an application in React with a backend in Ruby on Rails that allows to store the results of searching jobs using the public API of Get on Board (so there is no need to hit the server if the search was already done before).

## ❓The missing features

The challenge consists in implementing the following list of features for which you have **4 hours**:

1. Capability to delete searches: We would like to click on a icon and delete some of the searches.
1. Capability to refresh searches by avoiding duplications: If a search already exists then just refresh its list of jobs.
1. Capability to mark a job as favorite by adding a new `API::Jobs::FavoritesController` and its endpoint to the routes. As you can see the button **Fav** in the React app does nothing. The idea is to make it work.
1. Add **request specs** for searching and marking a job as favorite.
1. Refactor the React app adding the `Search` and `Job` components on their own files.

## 👩‍💻 To run the environment

You are a badass in React and Rails so we assume you have your dev enviroment set. The only things you have to do in order to run this app is:

```shell
$ bundle
$ yarn
$ rails db:migrate
$ rails s
```

Then as any rails app, it serves the app at [localhost:3000](http://localhost:3000).

Tip: In order to recompile the changes in the React app - while coding - you can run `$ yarn start` in a separate terminal.

## 🦶 Steps

- Clone this repo (Github Classroom will do it for you)
- Complete the code by implementing the missing features
- Push your repo
- Create a pull request

Important: You have **4 hours** to complete the challenge. No more time, just **4 hours**.

## 📃 Disclaimer

This is an exercise without any commercial purpose and Get on Board will never by any means:

- Share or use your code
- Oblige you to take this exercise
- Compensate you in any form for taking this exercise

Have fun 🥳 and stay safe at 🏠.
