#pragma once

#include <QObject>
#include <QtUtils/ModelMacros.h>

class VirtualKeyboardModel: public QObject {
	Q_OBJECT
	Q_PROPERTY_FULL(focusItem, FocusItem, QObject *)

	public:
		VirtualKeyboardModel();
		virtual ~VirtualKeyboardModel();

	signals:
		void hideInputPanel();

};

