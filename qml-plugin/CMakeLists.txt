
cmake_minimum_required(VERSION 3.0)
project(freevirtualkeyboardplugin)

find_package(Qt5 REQUIRED COMPONENTS Qml Quick)
find_package(Qt5Gui CONFIG REQUIRED Private)
find_package(Qt5Quick CONFIG REQUIRED Private)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)


file(GLOB_RECURSE ${PROJECT_NAME}.Sources "src/*.cpp")
file(GLOB_RECURSE ${PROJECT_NAME}.Headers "src/*.h")
file(GLOB_RECURSE ${PROJECT_NAME}.Ui RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "qml/*")
file(GLOB_RECURSE ${PROJECT_NAME}.Img RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "images/*")


set(UI_MEM "<!DOCTYPE RCC>\n")
set(UI_MEM "${UI_MEM}<RCC version=\"1.0\">\n")
set(UI_MEM "${UI_MEM}  <qresource>\n")
foreach(filename ${${PROJECT_NAME}.Ui})
	set(UI_MEM "${UI_MEM}    <file>${filename}</file>\n")
endforeach(filename)
foreach(filename ${${PROJECT_NAME}.Img})
	set(UI_MEM "${UI_MEM}    <file>${filename}</file>\n")
endforeach(filename)
set(UI_MEM "${UI_MEM}  </qresource>\n")
set(UI_MEM "${UI_MEM}</RCC>\n")

if (EXISTS "virtualkeyboard.qrc")
	file(READ "virtualkeyboard.qrc" UI_FILE)
	if (NOT "${UI_MEM}" STREQUAL "${UI_FILE}")
		file(WRITE "virtualkeyboard.qrc" "${UI_MEM}")
	endif()
else()
	file(WRITE "virtualkeyboard.qrc" "${UI_MEM}")
endif()


add_library(
    freevirtualkeyboardplugin
    SHARED

	${${PROJECT_NAME}.Sources}
	${${PROJECT_NAME}.Headers}
    virtualkeyboard.qrc
)


target_link_libraries(
    freevirtualkeyboardplugin
    PRIVATE
		Qt5::Qml
		Qt5::Quick
		Qt5::QuickPrivate		
        Qt5::GuiPrivate
)


	
message("Installing FreeVirtualKeyboard into Qt directory")

set(LIBRARY_OUTPUT_PATH "${CMAKE_PREFIX_PATH}/plugins/platforminputcontexts")
install(TARGETS "${PROJECT_NAME}" DESTINATION ".")

message("Copying FreeVirtualKeyboard qml files into: ${CMAKE_PREFIX_PATH}/qml/QtQuick/FreeVirtualKeyboard")
file(GLOB_RECURSE QML_FILES "qml/*" )
file(COPY ${QML_FILES} DESTINATION "${CMAKE_PREFIX_PATH}/qml/QtQuick/FreeVirtualKeyboard")
