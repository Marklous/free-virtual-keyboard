#pragma once

#include "VirtualKeyboardModel.h"
#include "QtUtils/ModelHolder.h"
#include <QQuickView>
#include <Poco/SharedPtr.h>

class VirtualKeyboard : public QObject{
    Q_OBJECT

public:
    typedef Poco::SharedPtr <VirtualKeyboard> Ptr;

    VirtualKeyboard(QQuickView * view, QQmlContext * ctx);
    ~VirtualKeyboard();

private:
    ModelHolder<VirtualKeyboardModel>::Ptr model;
    QQuickView * _view;
};