Qtino.NativeTextInput
=====================

Native text input for use from within Qml. Useful when QtQuick.Controls is not available (read: iOS).

I made this plugin because the Qml TextEdit component doesn't support text seek, copy/paste, magnify, etc on iOS and didn't think I'd be able to get my app through the iTunes AppStore approval process without such support. So this allows you to plug in a native editable text component in Qml and 'logically' integrate it with your layout. Currently, it's really only supported on iOS, but as I start porting some of my projects to other mobile platforms, I'll build out support as needed.

Note that since this is a native component, it lays on top of the Qt SceneGraph. This somewhat limits what you can do with it in terms of layouts and animations (no overlapping, and movement doesn't perfectly follow other items in the SceneGraph), and it further doesn't support the rich set of cursor, highlight, input filters, etc. that come with the TextEdit component. But having said that, it's the best solution I have right now for easily integrating native text-edit features into a Qml-based UI. Might be a problem for older applications or advanced input needs, but I've found that it's not too big of a handicap for simple inputs or if you're building a new UI and create workarounds with these limitations in mind.

I plan to build out support for other platforms that might benefit from additional features of the native Text Edit equivalent. For the rest, (read: Desktop platforms) NativeTextInput will just wrap a regular Qml TextEdit component.

It would also be nice to build out the API further to support more of the standard QtQuick TextEdit features mentioned above (cursor, highlight, formatting, etc). If this is a blocking issue for you, but you want to use this component for a platform like iOS, you could try using File Selector to load different components for different platforms and get the best of both worlds.
