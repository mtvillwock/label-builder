# Label Builder

Web app for creating USPS shipping labels. Enter information for the TO address, FROM address, and parcel dimensions, then click submit to generate a URL link to a shipping-ready label PNG.

Test it out on Heroku: https://label-builder.herokuapp.com

Built using www.easypost.com.

## Reflection

Sinatra might have been more efficient choice in terms of getting things up and running quickly. However, using Rails provides extensibility for the future, especially regarding things like security, view helpers, and other features.

I decided to create a ```Shipment``` class that belong to an instance of the ```Parcel``` class as ```to_address``` and ```from_address``` (both instances of the ```Address``` class). This way addresses could have many shipments, but a parcel would only have one shipment associated with it.

I handled the logic of the API call in the controller, but during refactoring I would move that out of the controller and into a method in the ```Shipment``` model.

For future iterations I'd focus on:

- validations on form submissions so that users don't get an error when they submit invalid information
- building out model tests to verify all associations and validations are passing
- using stubs to mock/test the API call so I don't need to manually test the form submission
- user authentication
- styling