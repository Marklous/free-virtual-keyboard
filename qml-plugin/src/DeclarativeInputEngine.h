#pragma once

#include <QObject>
#include <QRect>

struct DeclarativeInputEnginePrivate;

/**
 * The input engine provides input context information and is responsible
 * for routing input events to focused QML items.
 * The InputEngine can be accessed as singleton instance from QML
 */
class DeclarativeInputEngine : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QRect keyboardRectangle READ keyboardRectangle WRITE setKeyboardRectangle NOTIFY keyboardRectangleChanged FINAL)
    Q_PROPERTY(bool animating READ isAnimating WRITE setAnimating NOTIFY animatingChanged FINAL)
    Q_PROPERTY(int inputMode READ inputMode WRITE setInputMode NOTIFY inputModeChanged FINAL)
    Q_ENUMS(InputMode)
private:
    DeclarativeInputEnginePrivate* d;
    friend class DeclarativeInputEnginePrivate;
    QObject * object_{nullptr};
    QString focusItemText_;

private slots:
    void animatingFinished();

public:
    /**
     * The InputMode enum provides a list of valid input modes
     */
    enum InputMode {Latin, Numeric, Dialable};

    /**
     * Creates a dclarative input engine with the given parent
     */
    explicit DeclarativeInputEngine(QObject *parent = 0);

    /**
     * Virtual destructor
     */
    virtual ~DeclarativeInputEngine();

    /**
     * Returns the kesyboard rectangle
     */
    QRect keyboardRectangle() const;

    /**
     * Returns the animating status
     */
    bool isAnimating() const;

    /**
     * Use this property to set the animating status, for example during UI
     * transitioning states.
     */
    void setAnimating(bool Animating);

    /**
     * Returns the current input mode
     * \see InputMode for a list of valid input modes
     */
    int inputMode() const;

    /**
     * Use this function to set the current input mode
     * \see InputMode for a list of valid input modes
     */
    void setInputMode(int Mode);



public slots:
    /**
     * Reverts the active key state without emitting the key event.
     * This method is useful when the user discards the current key and the
     * key state needs to be restored.
     * \note Not implemented yet and not used yet
     */
    void virtualKeyCancel();

    /**
     * Emits a key click event for the given key, text and modifiers.
     * Returns true if the key event was accepted by the input engine.
     * \note Not implemented yet and not used yet
     */
    bool virtualKeyClick(Qt::Key key, const QString & text, Qt::KeyboardModifiers modifiers);

    /**
     * Called by the keyboard layer to indicate that key was pressed, with the
     * given text and modifiers.
     * The key is set as an active key (down key). The actual key event is
     * triggered when the key is released by the virtualKeyRelease() method.
     * The key press event can be discarded by calling virtualKeyCancel().
     * The key press also initiates the key repeat timer if repeat is true.
     * Returns true if the key was accepted by this input engine.
     * \note Not implemented yet and not used yet
     */
    bool virtualKeyPress(Qt::Key key, const QString & text, Qt::KeyboardModifiers modifiers, bool repeat);

    /**
     * Releases the key at key. The method emits a key event for the input
     * method if the event has not been generated by a repeating timer.
     * The text and modifiers are passed to the input method.
     * Returns true if the key was accepted by the input engine
     * \note Not implemented yet and not used yet
     */
    bool virtualKeyRelease(Qt::Key key, const QString & text, Qt::KeyboardModifiers modifiers);

    /**
     * This function sends the given text to the focused QML item
     * \note This function will get replaced by virtualKeyClick function later
     */
    void sendKeyToFocusItem(const QString &keyText);

    /**
     * This function sends the given text to the focused QML item
     * \note This function will get replaced by virtualKeyClick function later
     */
    void sendKeyValueToFocusItem(const Qt::Key key);

    /**
     * Reports the active keyboard rectangle to the engine
     */
    void setKeyboardRectangle(const QRect& Rect);

    void setFocusObject(QObject *object);

signals:
    /**
     * Notify signal of keyboardRectangle property
     */
    void keyboardRectangleChanged();

    /**
     * Notify signal of animating property
     */
    void animatingChanged();

    /**
     * Notify signal of inputModep property
     */
    void inputModeChanged();

}; // class CDeclarativeInputEngine
