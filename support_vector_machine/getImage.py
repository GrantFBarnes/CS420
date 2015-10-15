import cImage
import csv
import os.path


a = []
lowerletters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
csvWriter = csv.writer(open('letters.csv', 'w',newline=''))

for letter in lowerletters:
	a=[]
	for x in range(200):
		if os.path.isfile("training/lower/"+letter+"/" + str(x) + ".gif"):
			img = cImage.FileImage("training/lower/"+letter+"/" + str(x) + ".gif")


			vals = []
			for row in range(img.getHeight()):
				for col in range(img.getWidth()):
					p = img.getPixel(col,row)
					val = (p.getRed()+p.getGreen()+p.getBlue())//3
					vals.append(val)
			vals.append(letter)
			a.append(vals)


	for x in range(len(a)):
		csvWriter.writerow(a[x])


a = []
upperletters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']

for letter in upperletters:
	a=[]
	for x in range(200):
		if os.path.isfile("training/upper/"+letter+"/" + str(x) + ".gif"):
			img = cImage.FileImage("training/upper/"+letter+"/" + str(x) + ".gif")


			vals = []
			for row in range(img.getHeight()):
				for col in range(img.getWidth()):
					p = img.getPixel(col,row)
					val = (p.getRed()+p.getGreen()+p.getBlue())//3
					vals.append(val)
			vals.append(letter)
			a.append(vals)


	for x in range(len(a)):
		csvWriter.writerow(a[x])

print("done")
