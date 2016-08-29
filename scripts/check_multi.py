import csv
import sys
import getopt

def univoco(input_file, column):
	with open(input_file, 'rb') as csvfile:
		reader = csv.reader(csvfile, lineterminator = '\n')
		row = next(reader)
		a = row.index(column)
		f = []
		for row in reader:
			f.append(row[a])
		if len(f) != len(set(f)):
			print("Ci sono elementi uguali")
		else:
			print("La colonna e' univoca")

def main(argv):
	global inputfile, header
	try:
		opts, args=getopt.getopt(argv, "hi:o:", ["ifile=", "col="])
	except getopt.GetoptError:
		print('ERROR: Wrong arguments')
		sys.exit(2)
	for opt, arg in opts:
		if opt in ("--ifile", "-i"):
			inputfile = arg
		elif opt == '--col':
			header = arg
	univoco(inputfile, header)	



if __name__ == '__main__':
        main(sys.argv[1:])		
