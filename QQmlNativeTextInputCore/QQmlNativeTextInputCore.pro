TEMPLATE = lib
TARGET = NativeTextInputPlugin
QT += qml quick
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = Qtino.NativeTextInput

ios { OS = iOS }
macx { OS = OSX }

unix: { libprefix = lib }
win32: { libprefix = }

CONFIG(static, static|shared) {
    macx|ios|unix: { libsuffix = a }
    win32: { libsuffix = lib }
}
else {
    macx: { libsuffix = dylib }
    unix:!macx: { libsuffix = so }
    win32: { libsuffix = lib }
}


installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)

target.path = $$installPath

cleanTarget.files +=
cleanTarget.path += $$installPath
macx|ios|unix: cleanTarget.extra = rm -rf $$installPath/*.qml $$installPath/qmldir $$installPath/plugins.qmltypes $$installPath/$$libprefix$$TARGET$${qtPlatformTargetSuffix}.$$libsuffix

qmldir.path = $$installPath
qmldir.files = $$PWD/$${OS}/qmldir

CONFIG += create_prl

OTHER_FILES += $$PWD/$${OS}/qmldir \
               $$PWD/$${OS}/*.qml

QMAKE_MOC_OPTIONS += -Muri=$$uri

ios {
    HEADERS += \
        NativeTextInputPlugin.h \
        NativeTextInput.h

    SOURCES += \
        NativeTextInputPlugin.cpp

    OBJECTIVE_SOURCES += \
        $$PWD/$${OS}/NativeTextInput.mm

    QMAKE_LFLAGS += -F/System/Library/Frameworks
    LIBS += -framework UIKit

    INSTALLS += cleanTarget target qmldir
}

macx {
    qmls.files = $$PWD/$${OS}/NativeTextInput.qml
    qmls.path = $$installPath

    INSTALLS += cleanTarget qmldir qmls
}

QMAKE_POST_LINK = make install
