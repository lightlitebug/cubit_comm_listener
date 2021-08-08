### flutter_bloc - Bloc-to-Bloc / Cubit-to-Cubit Communication using BlocListener 

#### Recommended way of bloc-to-bloc communication: Stream Subscription 
- Every bloc has a state stream which other blocs can subscribe to in order to react to changes within the bloc.

#### Definition of BlocListener
- BlocListener is a Flutter widget which takes a BlocWidgetListener and an optional Bloc and invokes the listener in response to state changes in the bloc. It should be used for functionality that needs to occur once per state change such as navigation, showing a SnackBar, showing a Dialog, etc 
  - listener is only called once for each state change (NOT including the initial state) unlike builder in BlocBuilder and is a void function
  - BlocListener do not rebuild UI

#### BlocListener as an alternative to StreamSubscription 
- BlocListener can be used to listen to state change from other blocs and then react to state changes
  - BlocListener manages StreamSubscription and cancel internally
  - So, we don’t need to care about those things 