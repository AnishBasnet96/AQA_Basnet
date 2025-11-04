cmake_minimum_required(VERSION 3.16)

project(aqa VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Core)


qt_add_executable(appaqa
    main.cpp
    controller.h controller.cpp
    healingworker.h healingworker.cpp
)

target_link_libraries(appaqa
    PRIVATE Qt6::Quick
)
target_link_libraries(appaqa PRIVATE Qt6::Core)
target_link_libraries(appaqa PRIVATE Qt6::Core)

qt_add_resources(appaqa "appaqa_qml"
PREFIX "/"
FILES
assets/Main.qml
icons/lungs.svg
icons/futbol.svg
icons/leaf.svg
icons/baby-carriage.svg
icons/baby.svg
icons/child-dress.svg
icons/person-dress.svg
icons/person-cane.svg
icons/mars.svg
icons/venus.svg
icons/child.svg
icons/circle-half-stroke.svg
icons/person.svg
icons/power-off.svg
icons/play.svg
icons/hand.svg
)
