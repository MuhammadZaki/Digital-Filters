# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'mainwindow.ui'
#
# Created by: PyQt5 UI code generator 5.10.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(1200, 768)
        self.centralWidget = QtWidgets.QWidget(MainWindow)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.centralWidget.sizePolicy().hasHeightForWidth())
        self.centralWidget.setSizePolicy(sizePolicy)
        self.centralWidget.setMinimumSize(QtCore.QSize(1200, 700))
        self.centralWidget.setMaximumSize(QtCore.QSize(1300, 700))
        self.centralWidget.setObjectName("centralWidget")
        self.table_points = QtWidgets.QTableWidget(self.centralWidget)
        self.table_points.setGeometry(QtCore.QRect(710, 0, 471, 331))
        self.table_points.setObjectName("table_points")
        self.table_points.setColumnCount(2)
        self.table_points.setRowCount(0)
        item = QtWidgets.QTableWidgetItem()
        self.table_points.setHorizontalHeaderItem(0, item)
        item = QtWidgets.QTableWidgetItem()
        self.table_points.setHorizontalHeaderItem(1, item)
        self.label_2 = QtWidgets.QLabel(self.centralWidget)
        self.label_2.setGeometry(QtCore.QRect(130, 620, 91, 16))
        self.label_2.setObjectName("label_2")
        self.resetBtn = QtWidgets.QPushButton(self.centralWidget)
        self.resetBtn.setGeometry(QtCore.QRect(860, 330, 93, 28))
        self.resetBtn.setObjectName("resetBtn")
        self.verticalLayoutWidget_2 = QtWidgets.QWidget(self.centralWidget)
        self.verticalLayoutWidget_2.setGeometry(QtCore.QRect(20, 0, 411, 351))
        self.verticalLayoutWidget_2.setObjectName("verticalLayoutWidget_2")
        self.zplaneLayout = QtWidgets.QVBoxLayout(self.verticalLayoutWidget_2)
        self.zplaneLayout.setContentsMargins(11, 11, 11, 11)
        self.zplaneLayout.setSpacing(6)
        self.zplaneLayout.setObjectName("zplaneLayout")
        self.verticalLayoutWidget_3 = QtWidgets.QWidget(self.centralWidget)
        self.verticalLayoutWidget_3.setGeometry(QtCore.QRect(20, 380, 241, 211))
        self.verticalLayoutWidget_3.setObjectName("verticalLayoutWidget_3")
        self.transferFunctionLayout = QtWidgets.QVBoxLayout(self.verticalLayoutWidget_3)
        self.transferFunctionLayout.setContentsMargins(11, 11, 11, 11)
        self.transferFunctionLayout.setSpacing(6)
        self.transferFunctionLayout.setObjectName("transferFunctionLayout")
        self.widget = QtWidgets.QWidget(self.centralWidget)
        self.widget.setGeometry(QtCore.QRect(700, 390, 481, 211))
        self.widget.setObjectName("widget")
        self.label = QtWidgets.QLabel(self.widget)
        self.label.setGeometry(QtCore.QRect(0, 100, 211, 20))
        self.label.setObjectName("label")
        self.browseBtn = QtWidgets.QPushButton(self.widget)
        self.browseBtn.setGeometry(QtCore.QRect(50, 130, 99, 27))
        self.browseBtn.setObjectName("browseBtn")
        self.saveBtn = QtWidgets.QPushButton(self.widget)
        self.saveBtn.setGeometry(QtCore.QRect(250, 130, 98, 27))
        self.saveBtn.setObjectName("saveBtn")
        self.label_4 = QtWidgets.QLabel(self.widget)
        self.label_4.setGeometry(QtCore.QRect(260, 100, 211, 20))
        self.label_4.setObjectName("label_4")
        self.verticalLayoutWidget = QtWidgets.QWidget(self.centralWidget)
        self.verticalLayoutWidget.setGeometry(QtCore.QRect(459, -1, 236, 331))
        self.verticalLayoutWidget.setObjectName("verticalLayoutWidget")
        self.verticalLayout = QtWidgets.QVBoxLayout(self.verticalLayoutWidget)
        self.verticalLayout.setContentsMargins(11, 11, 11, 11)
        self.verticalLayout.setSpacing(6)
        self.verticalLayout.setObjectName("verticalLayout")
        self.zeroRadio = QtWidgets.QRadioButton(self.verticalLayoutWidget)
        self.zeroRadio.setObjectName("zeroRadio")
        self.verticalLayout.addWidget(self.zeroRadio)
        self.poleRadio = QtWidgets.QRadioButton(self.verticalLayoutWidget)
        self.poleRadio.setObjectName("poleRadio")
        self.verticalLayout.addWidget(self.poleRadio)
        self.horizontalLayout = QtWidgets.QHBoxLayout()
        self.horizontalLayout.setSpacing(6)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.label_3 = QtWidgets.QLabel(self.verticalLayoutWidget)
        self.label_3.setObjectName("label_3")
        self.horizontalLayout.addWidget(self.label_3)
        self.xTxtBox = QtWidgets.QLineEdit(self.verticalLayoutWidget)
        self.xTxtBox.setObjectName("xTxtBox")
        self.horizontalLayout.addWidget(self.xTxtBox)
        self.label_7 = QtWidgets.QLabel(self.verticalLayoutWidget)
        self.label_7.setObjectName("label_7")
        self.horizontalLayout.addWidget(self.label_7)
        self.yTxtBox = QtWidgets.QLineEdit(self.verticalLayoutWidget)
        self.yTxtBox.setObjectName("yTxtBox")
        self.horizontalLayout.addWidget(self.yTxtBox)
        self.verticalLayout.addLayout(self.horizontalLayout)
        self.moveChkBox = QtWidgets.QCheckBox(self.verticalLayoutWidget)
        self.moveChkBox.setObjectName("moveChkBox")
        self.verticalLayout.addWidget(self.moveChkBox)
        self.lbl_point = QtWidgets.QLabel(self.verticalLayoutWidget)
        self.lbl_point.setText("")
        self.lbl_point.setObjectName("lbl_point")
        self.verticalLayout.addWidget(self.lbl_point)
        self.addBtn = QtWidgets.QPushButton(self.verticalLayoutWidget)
        self.addBtn.setObjectName("addBtn")
        self.verticalLayout.addWidget(self.addBtn)
        self.label_5 = QtWidgets.QLabel(self.centralWidget)
        self.label_5.setGeometry(QtCore.QRect(420, 620, 91, 16))
        self.label_5.setObjectName("label_5")
        self.widget_2 = QtWidgets.QWidget(self.centralWidget)
        self.widget_2.setGeometry(QtCore.QRect(319, 379, 231, 211))
        self.widget_2.setObjectName("widget_2")
        MainWindow.setCentralWidget(self.centralWidget)
        self.mainToolBar = QtWidgets.QToolBar(MainWindow)
        self.mainToolBar.setObjectName("mainToolBar")
        MainWindow.addToolBar(QtCore.Qt.TopToolBarArea, self.mainToolBar)
        self.menuBar = QtWidgets.QMenuBar(MainWindow)
        self.menuBar.setGeometry(QtCore.QRect(0, 0, 1200, 21))
        self.menuBar.setObjectName("menuBar")
        self.menuFile = QtWidgets.QMenu(self.menuBar)
        self.menuFile.setObjectName("menuFile")
        MainWindow.setMenuBar(self.menuBar)
        self.statusBar = QtWidgets.QStatusBar(MainWindow)
        self.statusBar.setObjectName("statusBar")
        MainWindow.setStatusBar(self.statusBar)
        self.menuBar.addAction(self.menuFile.menuAction())
        
        self.mplvlt1 = QtWidgets.QVBoxLayout(self.widget_2)
        self.mplvlt1.setObjectName("mplvlt1")


        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "  Zeros and Poles"))
        item = self.table_points.horizontalHeaderItem(0)
        item.setText(_translate("MainWindow", "Zeros"))
        item = self.table_points.horizontalHeaderItem(1)
        item.setText(_translate("MainWindow", "Poles"))
        self.label_2.setText(_translate("MainWindow", "Magnitude"))
        self.resetBtn.setText(_translate("MainWindow", "Reset"))
        self.label.setText(_translate("MainWindow", "Browse a filter"))
        self.browseBtn.setText(_translate("MainWindow", "Browse"))
        self.saveBtn.setText(_translate("MainWindow", "save"))
        self.label_4.setText(_translate("MainWindow", "save the filter"))
        self.zeroRadio.setText(_translate("MainWindow", "Add Zero"))
        self.poleRadio.setText(_translate("MainWindow", "Add Pole"))
        self.label_3.setText(_translate("MainWindow", "x"))
        self.label_7.setText(_translate("MainWindow", "y"))
        self.moveChkBox.setText(_translate("MainWindow", "Move Point"))
        self.addBtn.setText(_translate("MainWindow", "Add"))
        self.label_5.setText(_translate("MainWindow", "Phase"))
        self.menuFile.setTitle(_translate("MainWindow", "file"))

