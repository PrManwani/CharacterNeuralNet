import matlab.engine
eng = matlab.engine.start_matlab()
t = eng.handwriting()
print (t)