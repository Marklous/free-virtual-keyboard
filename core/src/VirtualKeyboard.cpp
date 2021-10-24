#include <VirtualKeyboard.h>
#include <QQuickItem>

VirtualKeyboard::VirtualKeyboard(QQuickView * view, QQmlContext * ctx) : _view(view) {
    model = new ModelHolder<VirtualKeyboardModel>(ctx, "virtualKeyboardModel");

    connect(view,&QQuickView::activeFocusItemChanged,[&]() {
        auto newActiveFocusItem = _view->activeFocusItem();
        if (!newActiveFocusItem) {
            return;
        }

        // hide panel if activeItem has no text adn inputType property
        if (not newActiveFocusItem->property("text").isValid() || not newActiveFocusItem->property("inputType").isValid()) {
            emit model->model()->hideInputPanel();
            model->model()->setFocusItem(nullptr);
            return;
        }
        model->model()->setFocusItem(newActiveFocusItem);
    });

}

VirtualKeyboard::~VirtualKeyboard() {
    
}