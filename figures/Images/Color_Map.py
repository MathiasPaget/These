import cv2;
import numpy as np;
import sys;

I=cv2.imread(sys.argv[1],-1);
coef = int(sys.argv[3]);

#gamma = 0.7
#I = I/255.0
#I = cv2.pow(I,gamma)

#I = (I+1)/1.0;
#I = 2/I;

I = I*coef;

#COLORMAP_JET COLORMAP_HSV
#J=cv2.applyColorMap(I,cv2.COLORMAP_BONE)
J=cv2.applyColorMap(I,cv2.COLORMAP_HSV)


#cv2.imshow('tada',J);
#cv2.waitKey(0)
#cv2.destroyAllWindows()

#cv2.imwrite(sys.argv[2],J*255);
cv2.imwrite(sys.argv[2],J);
