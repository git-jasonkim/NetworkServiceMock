# NetworkServiceMock
Mocking api request using NASA Open API

XCODE 10.1, SWIFT 4, Target >11.2

To make real requests, get api key here: https://api.nasa.gov/index.html#apply-for-an-api-key.  
Insert unique api key to NetworkingService.swift > "var apiKey"

ViewController.swift makes real queries to NASA - APOD: https://api.nasa.gov/api.html#apod and prints APOD title and url properties.
