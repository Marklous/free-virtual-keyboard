cmake_minimum_required(VERSION 3.0)
project(virtualkeyboard)

set(CMAKE_AUTOMOC ON)
set (CMAKE_INCLUDE_CURRENT_DIR ON)

file(GLOB_RECURSE ${PROJECT_NAME}.Sources "src/*.cpp")
file(GLOB_RECURSE ${PROJECT_NAME}.Headers "include/*.h")

find_package(Qt5 COMPONENTS Qml Quick)

add_library(${PROJECT_NAME} SHARED ${${PROJECT_NAME}.Sources} ${${PROJECT_NAME}.Headers})

target_include_directories(${PROJECT_NAME}
	PRIVATE src
	PUBLIC include
)

target_link_libraries(${PROJECT_NAME}
	PocoFoundation
	QtUtils
	Qt5::Quick
)

install(TARGETS "${PROJECT_NAME}" 
#TODO
)

