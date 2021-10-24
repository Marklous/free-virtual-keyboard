#pragma once

#include "virtualkeyboard_global.h"
#include <qpa/qplatforminputcontextplugin_p.h>

class VirtualKeyboardInputContextPlugin : public QPlatformInputContextPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QPlatformInputContextFactoryInterface_iid FILE "freevirtualkeyboard.json")

public:
    QPlatformInputContext *create(const QString&, const QStringList&);
};
