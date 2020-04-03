# context_provider
Flutter context provider to provide state with reducer combined as map of type and the reducer.\
along with the useSelector hook and useDispatch hook

# Usage
this package contains of 
```
  - ContextProvider Widget
  - useSelector function
  - useDispatch function
  - Reducer abstract class
```

## ContextProvider widget
Use it with following prop\
`Map<Type extends Reducer, Reducer> reducer` and `Widget child`\
```dart
  ContextProvider(reducer: myReducer, child: MyWidget());
```

the `Type` is implemented class from `Reducer` abstract class provided.

## useSelector function
Use this inside your widget to get the reducer/state data from the state.
```dart
final T myState = useSelector<T extends Reducer>(context)
```
where T is implementation of the `Reducer` abstract class.

You can pass another parameter if you decide to listen to the state changes.
```dart
final T myState = useSelector<T extends Reducer>(context, listen: false)
```
it's true by default.

## useDispatch function
```dart
final Function dispatch = useDispatch(context);
```
which `dispatch` function takes arguments of `Map<String, dynamic>` that had `type` key in the action.

you can pass another parameter if you want to listen to changes.
```dart
final Function dispatch = useDispatch(context, listen: true);
```
it's `false` by default.

## Reducer abstract class
Here's where you implement the state shape/what the state holds in the instance of the reducer.\
You want to `@override` the dispatch method inside the class and implement your own reducer to handle actions that'll be handled by the reducer instance.
```dart
@override
void dispatch(Map<String, dynamic> action) async {
  switch (action["type"]) {
    case "DO_SOMETHING":
    // do something with this
    break;
    default:
    break;
  }
}
```

methods that were available from this class is following\
```
  - notifyListeners 
```
Which `notifyListeners` is used whenever you want to notify the consumer of your state to re-render.
