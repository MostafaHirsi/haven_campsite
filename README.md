# haven_campsite
A Flutter project for calculating the time taken to transport all caravans

## Getting Started

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Tests for this application

This application has bloc tests written for it which tests the logic used to calculate the time to complete the routes.
It has a few tests implemented including happy path where a short journey is calculated and also a scenario where the data can't be retrieved from provider.

I've also included widget tests to test the front end of the app. Although there wasn't alot of UI to test, it would be handy to make sure that it is working well 
with the bloc.

## State Management

I chose to use the Bloc pattern as I'm more familiar with it. I also chose it because it handles state managements quite strictly minimising scenarios in which the app could crash.
Since this app requires data retrieval from a http endpoint, that increases the chance of it going wrong due to many network issues. That's why I chose this state management model over provider and mobx.

## UI

I've implemented a simple UI with a single button and a single text. The state of the button and the contents of that text should change based on the state returned from the blocs. As mentioned before, the ui is widget tested to ensure it all is working smoothly with the bloc.

## Business Logic

The bloc implemented does two things (other than accepting events and retrieving states). 
 - It retrieves and serializes the data returned from the http endpoint.
 - It calculates the fastest total route time for all caravans to be transported to their destination

The logic used to calculate fastest time isn't dynamic unfortunately so it wouldn't work with other maps. It only works for the map set out in the task due to the fact I've time boxed myself about 2-3 hours to get this task done. Given more time, I'd implement the route calculation in a backend (AWS/GCP etc.) and have returned that in an API call. Maybe a little machine learning could be used to make my life easier!


