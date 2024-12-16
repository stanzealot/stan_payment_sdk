# Flick SDK

#### A Flutter SDK to handle transactions with the Flick Payment API.

#### Features

- Make API requests to create a payment charge using the Flick API.
- Automatically open the generated checkout URL in the browser.
- Built-in error handling and user-friendly API.
- Simple and intuitive SDK structure for easy integration.

#### Usage

- Import the Package

```bash
import 'package:flick_sdk/flick_sdk.dart';
```

- Initialize the SDK  
   Create a new instance of the FlickSDK class in your app and provide the necessary parameters.

  ```bash
  await flick.createCharge(
  amount: 1000,
  currencyCollected: 'USD',
  currencySettled: 'USD',
  phoneNumber: '1234567890',
  email: 'example@gmail.com',
  transactionId: 'your-transaction-id',
  redirectUrl: 'https://your-redirect-url.com',  // Optional
  webhookUrl: 'https://your-webhook-url.com',    // Optional
  );

  ```

  > **Note:** Replace <YOUR_API_KEY> with the API key provided by Flick.

### Example App

- A complete example of how to use the SDK is provided in the example package.
