# alex_bodine

## Tests
```
rake test:unit
rake test:integration
```

## Deploy to Bluemix

NOTE: you will need the cf cmd line
```
$ cf login
API endpoint: https://api.ng.bluemix.net

Email> your.email@something.com

Password> 
Authenticating...
OK

Targeted org your.email@something.com

Select a space (or press enter to skip):
1. dev
2. prod

Space> dev
Targeted space dev


                   
API endpoint:   https://api.ng.bluemix.net (API version: 2.19.0)
User:           your.email@something.com
Org:            your.email@something.com
Space:          dev

$ cf push

# a bunch of logs about the app deploying
```
