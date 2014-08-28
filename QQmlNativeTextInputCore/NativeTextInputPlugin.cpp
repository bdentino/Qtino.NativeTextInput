#include "NativeTextInputPlugin.h"
#include "NativeTextInput.h"

#include <QtQml>

void NativeTextInputPlugin::registerTypes(const char *uri)
{
    // @uri Qtino.NativeTextInput
    qmlRegisterType<NativeTextInput>(uri, 1, 0, "NativeTextInput");
}
