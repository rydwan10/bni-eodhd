## BNI EODHD Crypto API Websocket

This project demonstrates how to use websockets to connect to a crypto exchange's API and display real-time price data in a chart.  
This Project using Flutter 3.24.1, Dart 3.5.1 and DevTools version 2.37.2


| https://github.com/user-attachments/assets/81a4caa1-f262-47cc-abc7-f4dfedf5d77d  |  https://github.com/user-attachments/assets/927e60d9-57a9-4a89-b699-803887d0365c |
|---|---|




### Packages used

* web_socket_channel: ^3.0.1
* equatable: ^2.0.5
* flutter_bloc: ^8.1.1
* dio: ^5.6.0
* alice: ^0.4.2
* intl: ^0.19.0
* fl_chart: ^0.68.0


### IMPORTANT NOTICE
I can't get the suitable Flutter Library to suit up the X-Axis time series response from the Websocket.  It actually works but you can't look the difference between each time series. So, for better visualization I added the simulate button to see what the graph looks like   
when the data set is correctly populated with correct format.

## How to run the application

* Clone The Project via Github
* Run flutter pub get command to get all the dependencies
* Make sure you already have emulator or real device running and plug in on you PC
* Run the app using flutter run command or click your IDE / Text Editor Run button

### Folder Structure

The project is organized into the following folders:

* **bloc** - Contains the business logic of the application, implemented using Flutter Bloc.
    * **crypto_line_chart** - Bloc for the crypto line chart.
        * **crypto_line_chart_cubit.dart** - The cubit class for the crypto line chart.
        * **crypto_line_chart_state.dart** - The state class for the crypto line chart.
    * **crypto_socket** - Bloc for the crypto socket connection.
        * **crypto_socket_cubit.dart** - The cubit class for the crypto socket connection.
        * **crypto_socket_state.dart** - The state class for the crypto socket connection.
* **constant.dart** - Stores constants used throughout the application.
* **data** - Contains data models and repositories.
    * **data** - Data models for the application.
        * **socket_response.dart** - Model class for the socket response.
    * **repository** - Repositories for fetching data.
        * **socket_crypto_repository.dart** - Repository for fetching crypto data from the websocket.
* **feature** - Contains the feature widgets of the application.
    * **chart** - Chart widgets for displaying crypto price data.
        * **chart_crypto.dart** - Base chart widget for crypto prices.
        * **line_chart_crypto.dart** - Line chart widget for displaying crypto prices over time.
* **home** - Contains the home screen of the application.
    * **home_screen.dart** - The home screen widget.
* **shared** - Contains widgets that are reused throughout the application.
    * **card_coin.dart** - Widget for displaying a coin's information.
* **utils.dart** - Utility functions used throughout the application.
* **main.dart** - The main entry point of the application.


