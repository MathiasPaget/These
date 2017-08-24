import sys, cv2, numpy as np;

cv2.imwrite(sys.argv[2],int(sys.argv[3])*cv2.imread(sys.argv[1]))
