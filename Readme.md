Federated plugins are a way of splitting support for different platforms into separate packages. So, a federated plugin can use one package for iOS, another for Android, another for web, and yet another for a car (as an example of an IoT device). Among other benefits, this approach allows a domain expert to extend an existing plugin to work for the platform they know best.

<img src="https://github.com/imrishukr/platform_information/assets/122599296/68bb5a41-8368-4764-84f6-c3b28062593e" alt="architecture federated plugins" width="700" height="400">

A federated plugin requires the following packages:

### app-facing package

The package that plugin users depend on to use the plugin. This package specifies the API used by the Flutter app.

### platform package(s)

One or more packages that contain the platform-specific implementation code. The app-facing package calls into these packages—they aren’t included in an app unless they contain platform-specific functionality accessible to the end user.

### platform interface package

The package that glues the app-facing package to the platform package(s). This package declares an interface that any platform package must implement to support the app-facing package. Having a single package that defines this interface ensures that all platform packages implement the same functionality uniformly.

### Endorsed federated plugin
Ideally, when adding a platform implementation to a federated plugin, you will coordinate with the package author to include your implementation. In this way, the original author endorses your implementation.

For example, say you write a foobar_windows implementation for the (imaginary) foobar plugin. In an endorsed plugin, the original foobar author adds your Windows implementation as a dependency in the pubspec for the app-facing package. Then, when a developer includes the foobar plugin in their Flutter app, the Windows implementation, as well as the other endorsed implementations, are automatically available to the app.

### Non-endorsed federated plugin
If you can’t, for whatever reason, get your implementation added by the original plugin author, then your plugin is not endorsed. A developer can still use your implementation, but must manually add the plugin to the app’s pubspec file. So, the developer must include both the foobar dependency and the foobar_windows dependency to achieve full functionality.

<img src="https://github.com/imrishukr/platform_information/assets/122599296/bad1a254-9690-4ef9-8393-d51e9392b802" alt="Screenshot 2024-02-23 183202" width="600" height="400">
<img src="https://github.com/imrishukr/platform_information/assets/122599296/4f6247e7-3a2f-4bd1-a5d3-b029c4c36db4" alt="Screenshot_1708693186" width="300" height="600">

### References:
[Developing packages & plugins](https://docs.flutter.dev/packages-and-plugins/developing-packages)

[Modern Flutter Plugin Development | by Chris Sells | Flutter | Medium](https://medium.com/flutter/modern-flutter-plugin-development-4c3ee015cf5a)

[Federated plugin implementations](https://docs.google.com/document/d/1LD7QjmzJZLCopUrFAAE98wOUQpjmguyGTN2wd_89Srs/edit?pli=1#heading=h.pub7jnop54q0)

[How To Develop A Flutter Plugin: A Comprehensive Guide](https://www.dhiwise.com/post/how-to-develop-a-flutter-plugin-a-comprehensive-guid)
