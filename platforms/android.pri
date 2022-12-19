android {
    lessThan(QT_MAJOR_VERSION, 6) {
        QT += androidextras
    }

    equals(QT_MAJOR_VERSION, 6) {
        QT += core-private
    }

    QMAKE_LFLAGS += -Wl,--hash-style=both

    DEFINES += USE_AWS_MEMORY_MANAGEMENT

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android/

    ANDROID_JAVA_SOURCE.path = /src/com/kiosk/example
    ANDROID_JAVA_SOURCE.files = $$files($$PWD/android/src/com/kiosk/example/*.java)

    INSTALLS += ANDROID_JAVA_SOURCE
}
