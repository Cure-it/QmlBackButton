#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>


#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
#if defined (Q_OS_ANDROID)
    #include <QtAndroid>
#endif
#else
#if defined (Q_OS_ANDROID)
#include <QtCore/private/qandroidextras_p.h>
#endif
#endif


int main(int argc, char *argv[])
{
    QCoreApplication::setOrganizationName("test");

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("ui_controller" ,  &app);

    const QUrl url("qrc:/qml/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
