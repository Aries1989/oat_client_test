TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

INCLUDEPATH += $$PWD/ext/oatpp/include \
               $$PWD/ext/oatpp-curl/include

SOURCES += \
    src/App.cpp \
    src/AsyncExample.cpp

HEADERS += \
    src/AsyncExample.hpp \
    src/DemoApiClient.hpp \
    src/DemoApiModels.hpp \
    src/SimpleExample.hpp


LIBS += -L$$PWD/ext/libcurl/lib \
        -llibcurl
LIBS += WS2_32.lib

CONFIG(debug, debug|release)
{
    LIBS += -L$$PWD/ext/oatpp/lib/debug \
            -loatpp
    LIBS += -L$$PWD/ext/oatpp-curl/lib/debug \
            -loatpp-curl
}
CONFIG(release, debug|release)
{
    LIBS += -L$$PWD/ext/oatpp/lib/release \
            -loatpp
    LIBS += -L$$PWD/ext/oatpp-curl/lib/release \
            -loatpp-curl
}

DESTDIR = $$PWD/bin
