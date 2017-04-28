#!/usr/bin/env python
import tkinter
import PIL
from tkinter import *
from PIL import ImageTk,Image
import matlab.engine
eng = matlab.engine.start_matlab()
#defiing functions
def printed():
	print ("Please give the path to the image as: C:/xxxx/xxxx/xx.jpg")
	path=input()
	#inputing image to tkinter
	root=Tk()
	img=ImageTk.Photoimage(Image.open(path))
	panel = Label(root,image=img)
	panel.pack(side="bottom",fill="both", expang="yes")
	root.mainloop()
	#run OCR
	

def handfull():
	print ("Please give the path to the image as: C:/xxxx/xxxx/xx.jpg")
	path=raw_input()
	root=Tk()
	img=ImageTk.Photoimage(Image.open(path))
	panel = Label(root,image=img)
	panel.pack(side="bottom",fill="both", expang="yes")
	root.mainloop()

def character():
	print("Please give the path to the image as: C:/xxxx/xxxx/xx.jpg")
	path=input()
	root=Tk()
	img=ImageTk.Photoimage(Image.open(path))
	panel = Label(root,image=img)
	panel.pack(side="bottom",fill="both", expang="yes")
	root.mainloop()
	#character call for handwritten

def handpart():
	print ("Please give the path to the image as: C:/xxxx/xxxx/xx.jpg")
	path=raw_input()
	root=Tk()
	img=ImageTk.Photoimage(Image.open(path))
	panel = Label(root,image=img)
	panel.pack(side="bottom",fill="both", expang="yes")
	root.mainloop()

	#cropping image algo



#defining radio buttons
top= Tk()
v=IntVar()
Radiobutton(top,text="Printed",variable=v,value=1,command=printed).pack(anchor=W)
Radiobutton(top,text="hand-full",variable=v,value=2,command=handfull).pack(anchor=W)
Radiobutton(top,text="hand-part",variable=v,value=3,command=handpart).pack(anchor=W)
Radiobutton(top,text="character",variable=v,value=4,command=character).pack(anchor=W)
mainloop()