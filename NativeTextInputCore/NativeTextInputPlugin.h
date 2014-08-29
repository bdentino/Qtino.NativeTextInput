#ifndef NATIVETEXTINPUTPLUGIN_H
#define NATIVETEXTINPUTPLUGIN_H

#include <QQmlExtensionPlugin>

class NativeTextInputPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif // NATIVETEXTINPUTPLUGIN_H
