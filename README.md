# Asynchronous Qt Assignment

**Author:** Anish Basnet  
**Platform:** Windows 11  
**Minimum Qt Version:** 6.2 (C++17 & QML)

---

## a. One-line description of the project
> A functional Qt 6 / QML prototype demonstrating asynchronous UI behavior and responsive animation handling for a medical-style interface.

---

## b. Supplementary comments on the work
This project implements a clean, object-oriented QML design with asynchronous behavior to decouple UI logic from core operations.

**Key focuses include:**
- Smooth, frame-consistent animations using `Behavior` and property bindings.  
- A context-driven backend (`core` object) managing transitions between *idle* and *healing* modes.  
- Consistent UI styling through reusable `BaseButton` components and a dark/light theme toggle.  

Artificial Intelligence assistance was used to better understand and adapt certain Qt 6 / QML-specific patterns, as the author’s prior experience was primarily with Qt 5.15.All recorded demonstration materials and implementation videos can be found in the provided Drive link.  

The final built executables are included under:
AQA_Basnet/dist/

## c. Feedback on the assignment
The assignment effectively evaluated both QML design principles and asynchronous logic comprehension, providing flexibility to design functional UI states and transitions within time constraints.

**Future Improvements**
- Further modularize components (`BottomBreather.qml`, `RightIcon.qml`, `StyledButton.qml`) for maintainability.  
- Introduce asynchronous worker threads (`QThread`, `QtConcurrent`) to simulate backend processing.  
- Improve transition coherence with synchronized easing across multiple UI elements.  

**Challenges Faced**
- Limited prior experience with Qt 6 and its newer QML modules.  
- Time constraints restricted full implementation of dynamic scaling and lung translation for the bottom component.  
- Debugging and fine-tuning QML animations proved more complex than expected under time pressure.

---

## d. Installation & Build Instructions

### Requirements
- **Operating System:** Windows 11  
- **Qt Version:** Qt 6.2 or newer (tested with Qt 6.7.3, MinGW 64-bit)  
- **Build System:** CMake or QMake (Qt Creator default setup)  
- **Compiler:** MinGW 11.2.0  

---

### Steps to Build
# 1. Clone the repository
 - git clone https://github.com/AnishBasnet96/AQA_Basnet.git and cd AQA_Basnet


# 2. Open the project in Qt Creator
  - Select the "Qt 6.7.3 MinGW 64-bit" kit.

# 3. Build and run the project
  - The executable will be located at: build\Desktop_Qt_6_7_3_MinGW_64_bit-Release\appaqa.exe
     
# 4. Deployment (Packaging for Distribution)

- "C:\Qt\6.7.3\mingw_64\bin\windeployqt6.exe" "C:\path\to\build\Desktop_Qt_6_7_3_MinGW_64_bit-Release\appaqa.exe"
- This command copies all required Qt .dll and QML dependencies into the same directory as the executable.

- The fully deployed application is included in: AQA_Basnet/dist/

# 5. Recording
The complete implementation and demonstration recording can be accessed through the shared Google Drive link https://drive.google.com/file/d/1pzsod4iLKgm-NaHnAxOSV_f7mjOjABH8/view?usp=sharing provided with this submission.

License
© 2025 Anish Basnet
This project is for educational and evaluation purposes only.
